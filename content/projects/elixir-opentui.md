---
title: "elixir-opentui"
type: page
summary: "Porting a TypeScript terminal-UI library to Elixir — bringing rich TUI primitives to the BEAM."
active: true
repo: "https://github.com/jyooi/elixir-opentui"
---

### TUI primitives on the BEAM

I&rsquo;m porting [OpenTUI](https://github.com/sst/opentui) &mdash; a TypeScript terminal UI toolkit &mdash; over to Elixir. The aim is to bring composable TUI primitives (panes, layouts, inputs, ANSI buffered rendering) into reach of Elixir programs, while leaning into what the BEAM gives us for free: lightweight processes per widget, message-passing for input/render loops, and OTP supervision around long-running terminal sessions.

This pairs naturally with [Phoenix LiveView](https://hexdocs.pm/phoenix_live_view) thinking &mdash; a render tree that diffs and patches &mdash; only the &ldquo;DOM&rdquo; is the terminal cell grid.

[github.com/jyooi/elixir-opentui](https://github.com/jyooi/elixir-opentui)
