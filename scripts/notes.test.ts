import { describe, expect, test } from "bun:test";
import {
  buildLinkContext,
  convertBody,
  parseNote,
  renderNotes,
  slugify,
  toHugoMarkdown,
} from "./notes";

const note = (path: string, raw: string) => parseNote(path, raw);

describe("parseNote", () => {
  test("splits frontmatter and body", () => {
    const n = note("Notes/Hello World.md", "---\npublish: true\ntags: [til]\n---\nbody here\n");
    expect(n.basename).toBe("Hello World");
    expect(n.frontmatter.publish).toBe(true);
    expect(n.frontmatter.tags).toEqual(["til"]);
    expect(n.body).toBe("body here\n");
  });

  test("handles a note without frontmatter", () => {
    const n = note("Notes/Plain.md", "just text");
    expect(n.frontmatter).toEqual({});
    expect(n.body).toBe("just text");
  });
});

describe("slugify", () => {
  test("lowercases, strips accents, collapses separators", () => {
    expect(slugify("Héllo  World! (v2)")).toBe("hello-world-v2");
  });
});

describe("convertBody", () => {
  const a = note("Notes/Kube Lessons.md", "---\npublish: true\ndate: 2026-08-01\n---\n");
  const ctx = buildLinkContext([a]);

  test("links to a published note", () => {
    const { body } = convertBody("see [[Kube Lessons]] now", ctx);
    expect(body).toBe("see [Kube Lessons](/notes/kube-lessons/) now");
  });

  test("uses alias as label", () => {
    const { body } = convertBody("see [[Kube Lessons|this]]", ctx);
    expect(body).toBe("see [this](/notes/kube-lessons/)");
  });

  test("keeps heading anchors", () => {
    const { body } = convertBody("[[Kube Lessons#Pod Lifecycle]]", ctx);
    expect(body).toBe("[Kube Lessons](/notes/kube-lessons/#pod-lifecycle)");
  });

  test("matches case-insensitively", () => {
    const { body } = convertBody("[[kube lessons]]", ctx);
    expect(body).toBe("[kube lessons](/notes/kube-lessons/)");
  });

  test("strips links to unpublished notes to plain text", () => {
    const { body } = convertBody("read [[Private Idea|my idea]] and [[Other]]", ctx);
    expect(body).toBe("read my idea and Other");
  });

  test("converts image embeds and records assets", () => {
    const { body, assets } = convertBody("![[attachments/diagram.png|The diagram]]", ctx);
    expect(body).toBe("![The diagram](/images/notes/diagram.png)");
    expect(assets).toEqual(["attachments/diagram.png"]);
  });

  test("treats note embeds as links", () => {
    const { body } = convertBody("![[Kube Lessons]]", ctx);
    expect(body).toBe("[Kube Lessons](/notes/kube-lessons/)");
  });
});

describe("renderNotes", () => {
  test("includes only publish: true notes, newest first", () => {
    const all = [
      note("Notes/Old.md", "---\npublish: true\ndate: 2026-01-01\n---\nold"),
      note("Notes/Draft.md", "---\npublish: false\ndate: 2026-02-01\n---\ndraft"),
      note("Notes/New.md", "---\npublish: true\ndate: 2026-03-01\n---\nnew"),
      note("Notes/Untagged.md", "no frontmatter"),
    ];
    const { notes, errors } = renderNotes(all);
    expect(errors).toEqual([]);
    expect(notes.map((n) => n.slug)).toEqual(["new", "old"]);
  });

  test("reports a missing date instead of guessing", () => {
    const { notes, errors } = renderNotes([
      note("Notes/NoDate.md", "---\npublish: true\n---\nx"),
    ]);
    expect(notes).toEqual([]);
    expect(errors[0]).toContain("NoDate.md");
    expect(errors[0]).toContain("date");
  });

  test("accepts YAML date values", () => {
    const { notes } = renderNotes([
      note("Notes/D.md", "---\npublish: true\ndate: 2026-08-23\n---\nx"),
    ]);
    expect(notes[0].date).toBe("2026-08-23");
  });

  test("reports slug clashes", () => {
    const { errors } = renderNotes([
      note("Notes/A B.md", "---\npublish: true\ndate: 2026-01-01\n---\n"),
      note("Notes/a-b.md", "---\npublish: true\ndate: 2026-01-02\n---\n"),
    ]);
    expect(errors).toHaveLength(1);
    expect(errors[0]).toContain("clashes");
  });

  test("honours explicit slug, title, summary and comma tags", () => {
    const { notes } = renderNotes([
      note(
        "Notes/File Name.md",
        "---\npublish: true\ndate: 2026-01-01\nslug: Custom Slug\ntitle: Nice Title\nsummary: short\ntags: til, opinion\n---\nbody",
      ),
    ]);
    expect(notes[0]).toMatchObject({
      slug: "custom-slug",
      title: "Nice Title",
      summary: "short",
      tags: ["til", "opinion"],
    });
  });
});

describe("toHugoMarkdown", () => {
  test("writes Hugo frontmatter with a vault marker", () => {
    const out = toHugoMarkdown({
      slug: "x",
      title: 'Quote "me"',
      date: "2026-08-23",
      tags: ["til"],
      summary: "s",
      body: "hello",
      assets: [],
    });
    expect(out).toBe(
      [
        "---",
        'title: "Quote \\"me\\""',
        "date: 2026-08-23",
        'tags: ["til"]',
        'summary: "s"',
        "source: vault",
        "---",
        "",
        "hello",
        "",
      ].join("\n"),
    );
  });
});
