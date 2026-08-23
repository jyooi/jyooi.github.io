# jyooi.com

Personal site: [jyooi.com](https://jyooi.com). Hugo, hand-tuned CSS, terminal theme.

## Layout

- `/` - short intro, latest notes, projects, links.
- `/notes/` - dated notes, tagged `til`, `opinion`, `weekly`. RSS at `/notes/index.xml`.
- `/projects/` - side project write-ups in `content/projects/`.
- `/about/` - work history from `data/experience.yaml`, skills, contact.

## Notes workflow

Notes are written in the Obsidian vault at `~/Documents/Obsidian Vault/Notes/`.
A note publishes when its frontmatter has `publish: true` and a `date`.

```yaml
---
publish: true
date: 2026-08-23
tags: [til]
summary: One line shown in lists. Optional.
slug: custom-slug   # optional, defaults to the file name
---
```

Then run:

```sh
bun run publish          # copy published notes into content/notes, copy images to static/images/notes
bun run publish:check    # report drift only, exit 1 if the site is behind the vault
```

Wikilinks to other published notes become site links. Wikilinks to private notes become plain text.
Image embeds `![[file.png]]` copy into `static/images/notes/`.
Generated files carry `source: vault` in frontmatter. Do not edit them by hand. The next publish run removes notes that lost their `publish` flag.

Set `VAULT_DIR` to point at another vault.

## Develop

```sh
bun install
bun test              # publish script tests
bun run typecheck
hugo server -D
```

Resume sources live in `resume/` (Typst). See `resume/build.sh`.
