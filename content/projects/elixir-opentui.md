---
title: "elixir-opentui"
type: page
summary: "A terminal UI framework for Elixir with a high-performance Zig NIF backend — Elm-inspired architecture, a declarative View DSL, and 15+ widgets."
active: true
repo: "https://github.com/jyooi/elixir-opentui"
---

### A TUI framework on the BEAM, with a Zig core

[elixir-opentui](https://github.com/jyooi/elixir-opentui) is a terminal UI framework for Elixir. You build applications from an Elm-inspired triple — `init` sets up state, `handle_event` folds keyboard and mouse input into new state or `:quit`, and `render` returns a UI tree written in a declarative View DSL. It ships 15+ widgets: text input, select, checkbox, scroll box, tabs, textarea, code viewer, markdown renderer, and diff viewer among them, with flexbox-inspired layout and syntax highlighting.

It started as a port of [OpenTUI](https://github.com/sst/opentui), a TypeScript terminal UI toolkit, and grew into its own thing once the rendering model had to answer to the BEAM.

### Why there is Zig in an Elixir project

The render pipeline turns an element tree into flexbox layout, paints it into a cell buffer, diffs that against the previous frame, and emits only the ANSI needed to reconcile the difference. That is a tight numeric loop over a large mutable buffer, run every frame — precisely the shape of work the BEAM is worst at.

So the hot path drops into Zig through NIFs: double buffering, frame diffing, the cell buffer itself, and rope structures for text. Everything above it stays in Elixir, where per-widget processes, message passing, and OTP supervision around long-running terminal sessions are free.

The NIF is optional. There is a pure-Elixir fallback for the whole pipeline, so the framework compiles and runs without a Zig toolchain present — you trade throughput for portability and nothing else.

### Trying it

The repository carries 17 runnable demo examples covering each widget and the layout system. It is MIT licensed.

[github.com/jyooi/elixir-opentui](https://github.com/jyooi/elixir-opentui)
