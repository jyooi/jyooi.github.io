#!/usr/bin/env bun
// Copy notes marked `publish: true` from the Obsidian vault into content/notes.
// Usage: bun scripts/publish.ts [--check]
//   --check  report what would change and exit non-zero on drift, write nothing.
// Env: VAULT_DIR overrides the vault location.

import { readdir, mkdir, rm, copyFile, stat } from "node:fs/promises";
import { join, resolve, dirname } from "node:path";
import { homedir } from "node:os";
import { parseNote, renderNotes, toHugoMarkdown, type VaultNote } from "./notes";

const REPO = resolve(dirname(import.meta.path), "..");
const VAULT = process.env.VAULT_DIR ?? join(homedir(), "Documents", "Obsidian Vault");
const NOTES_SRC = join(VAULT, "Notes");
const NOTES_OUT = join(REPO, "content", "notes");
const IMAGES_OUT = join(REPO, "static", "images", "notes");
const CHECK = process.argv.includes("--check");

async function walk(dir: string): Promise<string[]> {
  const out: string[] = [];
  for (const entry of await readdir(dir, { withFileTypes: true })) {
    if (entry.name.startsWith(".")) continue;
    const full = join(dir, entry.name);
    if (entry.isDirectory()) out.push(...(await walk(full)));
    else out.push(full);
  }
  return out;
}

async function readVaultNotes(): Promise<VaultNote[]> {
  const files = (await walk(NOTES_SRC)).filter((f) => f.endsWith(".md"));
  return Promise.all(
    files.map(async (f) => parseNote(f.slice(VAULT.length + 1), await Bun.file(f).text())),
  );
}

async function existingVaultOutputs(): Promise<Map<string, string>> {
  const out = new Map<string, string>();
  try {
    for (const name of await readdir(NOTES_OUT)) {
      if (!name.endsWith(".md") || name === "_index.md") continue;
      const text = await Bun.file(join(NOTES_OUT, name)).text();
      if (/^source: vault$/m.test(text)) out.set(name.replace(/\.md$/, ""), text);
    }
  } catch {
    // content/notes does not exist yet
  }
  return out;
}

async function findAsset(ref: string, index: Map<string, string>): Promise<string | null> {
  const direct = join(VAULT, ref);
  try {
    if ((await stat(direct)).isFile()) return direct;
  } catch {
    // fall through to basename lookup
  }
  return index.get(ref.split("/").pop()!.toLowerCase()) ?? null;
}

async function main() {
  const all = await readVaultNotes();
  const { notes, errors } = renderNotes(all);
  if (errors.length) {
    console.error("publish: refusing to continue:\n  " + errors.join("\n  "));
    process.exit(1);
  }

  const existing = await existingVaultOutputs();
  const added: string[] = [];
  const updated: string[] = [];
  const unchanged: string[] = [];
  const removed = [...existing.keys()].filter((s) => !notes.some((n) => n.slug === s));

  const vaultFiles = await walk(VAULT);
  const assetIndex = new Map(vaultFiles.map((f) => [f.split("/").pop()!.toLowerCase(), f]));
  const assetErrors: string[] = [];
  const assetCopies: Array<[string, string]> = [];

  for (const note of notes) {
    const md = toHugoMarkdown(note);
    const prev = existing.get(note.slug);
    if (prev === undefined) added.push(note.slug);
    else if (prev !== md) updated.push(note.slug);
    else unchanged.push(note.slug);

    for (const ref of note.assets) {
      const src = await findAsset(ref, assetIndex);
      if (!src) assetErrors.push(`${note.slug}: asset not found in vault: ${ref}`);
      else assetCopies.push([src, join(IMAGES_OUT, src.split("/").pop()!)]);
    }

    if (!CHECK && prev !== md) {
      await mkdir(NOTES_OUT, { recursive: true });
      await Bun.write(join(NOTES_OUT, `${note.slug}.md`), md);
    }
  }

  if (assetErrors.length) {
    console.error("publish: refusing to continue:\n  " + assetErrors.join("\n  "));
    process.exit(1);
  }

  if (!CHECK) {
    if (assetCopies.length) await mkdir(IMAGES_OUT, { recursive: true });
    for (const [src, dst] of assetCopies) await copyFile(src, dst);
    for (const slug of removed) await rm(join(NOTES_OUT, `${slug}.md`));
  }

  const label = CHECK ? "would" : "did";
  console.log(`publish (${label}):`);
  console.log(`  added     ${added.length}${added.length ? "  " + added.join(", ") : ""}`);
  console.log(`  updated   ${updated.length}${updated.length ? "  " + updated.join(", ") : ""}`);
  console.log(`  removed   ${removed.length}${removed.length ? "  " + removed.join(", ") : ""}`);
  console.log(`  unchanged ${unchanged.length}`);
  console.log(`  assets    ${assetCopies.length}`);

  const drift = added.length + updated.length + removed.length;
  if (CHECK) process.exit(drift ? 1 : 0);

  if (drift) {
    const diff = Bun.spawnSync(["git", "status", "--short", "content/notes", "static/images/notes"], {
      cwd: REPO,
    });
    process.stdout.write("\n" + diff.stdout.toString());
    console.log("\nReview, then commit and push.");
  }
}

await main();
