---
title: "elixir-opentui"
type: page
summary: "A terminal UI framework for Elixir with a Zig NIF backend. It provides Elm-inspired architecture, a declarative View DSL, and 15+ widgets."
active: true
repo: "https://github.com/jyooi/elixir-opentui"
---

### A TUI framework on the BEAM, with a Zig core

[elixir-opentui](https://github.com/jyooi/elixir-opentui) is a terminal UI framework for Elixir. You build an application from three functions. `init` sets the initial state. `handle_event` updates the state from keyboard and mouse input or returns `:quit` to stop. `render` returns a UI tree in a declarative View DSL.

The framework ships 15+ widgets. Examples include text input, select, checkbox, scroll box, tabs, textarea, code viewer, markdown renderer, and diff viewer. It provides flexbox layout and syntax highlight.

It started as a port of [OpenTUI](https://github.com/sst/opentui). OpenTUI is a TypeScript terminal UI toolkit. The project became independent when the render model needed to match the BEAM.

### Why Zig is part of an Elixir project

The render pipeline converts an element tree to a flexbox layout. It paints the result into a cell buffer. It compares the buffer with the previous frame. It emits only the ANSI that reconciles the difference. This loop runs each frame over a large mutable buffer. The BEAM handles this type of work poorly.

The hot path uses Zig through NIFs. It covers double buffer, frame diff, the cell buffer, and rope structures for text. Everything above the hot path stays in Elixir. Elixir provides per-widget processes, message pass, and OTP supervision for long terminal sessions at no extra cost.

The NIF is optional. A pure-Elixir fallback covers the whole pipeline. The framework compiles and runs without a Zig toolchain. You trade throughput for portability and nothing more.

### Try it

The repository includes 17 runnable demo examples. The examples cover each widget and the layout system. The project uses the MIT license.

[github.com/jyooi/elixir-opentui](https://github.com/jyooi/elixir-opentui)
