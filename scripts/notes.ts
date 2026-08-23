// Pure functions for turning Obsidian vault notes into Hugo content.
// No filesystem access here. publish.ts wires these to disk.

export type Frontmatter = Record<string, unknown>;

export interface VaultNote {
  path: string;
  basename: string;
  frontmatter: Frontmatter;
  body: string;
}

export interface PublishedNote {
  slug: string;
  title: string;
  date: string;
  tags: string[];
  summary?: string;
  body: string;
  assets: string[];
}

export interface RenderResult {
  notes: PublishedNote[];
  errors: string[];
}

const FRONTMATTER_RE = /^---\r?\n([\s\S]*?)\r?\n---\r?\n?/;
const IMAGE_EXT_RE = /\.(png|jpe?g|gif|webp|svg|avif)$/i;

export function parseNote(path: string, raw: string): VaultNote {
  const basename = path.split("/").pop()!.replace(/\.md$/i, "");
  const match = raw.match(FRONTMATTER_RE);
  if (!match) {
    return { path, basename, frontmatter: {}, body: raw };
  }
  const parsed = Bun.YAML.parse(match[1]);
  const frontmatter =
    parsed && typeof parsed === "object" && !Array.isArray(parsed)
      ? (parsed as Frontmatter)
      : {};
  return { path, basename, frontmatter, body: raw.slice(match[0].length) };
}

export function slugify(input: string): string {
  return input
    .toLowerCase()
    .normalize("NFKD")
    .replace(/[\u0300-\u036f]/g, "")
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/^-+|-+$/g, "");
}

export function isPublished(note: VaultNote): boolean {
  return note.frontmatter.publish === true;
}

function asStringArray(value: unknown): string[] {
  if (Array.isArray(value)) return value.map(String);
  if (typeof value === "string") {
    return value
      .split(",")
      .map((s) => s.trim())
      .filter(Boolean);
  }
  return [];
}

function asDate(value: unknown): string | null {
  if (value instanceof Date) return value.toISOString().slice(0, 10);
  if (typeof value === "string" && /^\d{4}-\d{2}-\d{2}/.test(value)) {
    return value.slice(0, 10);
  }
  return null;
}

export function slugFor(note: VaultNote): string {
  const explicit = note.frontmatter.slug;
  if (typeof explicit === "string" && explicit.trim()) return slugify(explicit);
  return slugify(note.basename);
}

export function titleFor(note: VaultNote): string {
  const explicit = note.frontmatter.title;
  if (typeof explicit === "string" && explicit.trim()) return explicit.trim();
  return note.basename;
}

const WIKILINK_RE = /(!?)\[\[([^\]|#]+)(#[^\]|]*)?(?:\|([^\]]*))?\]\]/g;

export interface LinkContext {
  slugByTarget: Map<string, string>;
}

export function buildLinkContext(published: VaultNote[]): LinkContext {
  const slugByTarget = new Map<string, string>();
  for (const note of published) {
    const slug = slugFor(note);
    slugByTarget.set(note.basename.toLowerCase(), slug);
    const title = titleFor(note).toLowerCase();
    if (!slugByTarget.has(title)) slugByTarget.set(title, slug);
  }
  return { slugByTarget };
}

export function convertBody(
  body: string,
  ctx: LinkContext,
): { body: string; assets: string[] } {
  const assets: string[] = [];
  const converted = body.replace(
    WIKILINK_RE,
    (_m, bang: string, target: string, anchor = "", alias?: string) => {
      const cleanTarget = target.trim();
      if (bang === "!" && IMAGE_EXT_RE.test(cleanTarget)) {
        const name = cleanTarget.split("/").pop()!;
        assets.push(cleanTarget);
        const alt = alias?.trim() ?? "";
        return `![${alt}](/images/notes/${name})`;
      }
      const label = (alias ?? cleanTarget).trim();
      const key = cleanTarget.replace(/\.md$/i, "").toLowerCase();
      const slug = ctx.slugByTarget.get(key);
      if (!slug) return label;
      const fragment = anchor ? "#" + slugify(anchor.slice(1)) : "";
      return `[${label}](/notes/${slug}/${fragment})`;
    },
  );
  return { body: converted, assets };
}

export function renderNotes(all: VaultNote[]): RenderResult {
  const errors: string[] = [];
  const published = all.filter(isPublished);
  const ctx = buildLinkContext(published);
  const seen = new Map<string, string>();
  const notes: PublishedNote[] = [];

  for (const note of published) {
    const slug = slugFor(note);
    if (!slug) {
      errors.push(`${note.path}: cannot derive a slug`);
      continue;
    }
    const clash = seen.get(slug);
    if (clash) {
      errors.push(`${note.path}: slug "${slug}" clashes with ${clash}`);
      continue;
    }
    seen.set(slug, note.path);

    const date = asDate(note.frontmatter.date);
    if (!date) {
      errors.push(`${note.path}: missing or invalid "date" (expected YYYY-MM-DD)`);
      continue;
    }

    const { body, assets } = convertBody(note.body.trim(), ctx);
    const summary = note.frontmatter.summary ?? note.frontmatter.description;
    notes.push({
      slug,
      title: titleFor(note),
      date,
      tags: asStringArray(note.frontmatter.tags),
      summary: typeof summary === "string" ? summary.trim() : undefined,
      body,
      assets,
    });
  }

  notes.sort((a, b) => (a.date < b.date ? 1 : a.date > b.date ? -1 : 0));
  return { notes, errors };
}

function yamlString(value: string): string {
  return JSON.stringify(value);
}

export function toHugoMarkdown(note: PublishedNote): string {
  const lines = [
    "---",
    `title: ${yamlString(note.title)}`,
    `date: ${note.date}`,
    `tags: [${note.tags.map(yamlString).join(", ")}]`,
  ];
  if (note.summary) lines.push(`summary: ${yamlString(note.summary)}`);
  lines.push("source: vault", "---", "", note.body, "");
  return lines.join("\n");
}
