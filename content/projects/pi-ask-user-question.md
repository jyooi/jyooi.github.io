---
title: "pi-ask-user-question"
type: page
summary: "A pi TUI extension that lets agents ask structured 1-4 question decisions with multi-select and free-text Other support."
active: true
repo: "https://github.com/jyooi/pi-ask-user-question"
weight: 20
---

### A structured way for pi agents to ask

[pi-ask-user-question](https://github.com/jyooi/pi-ask-user-question) gives pi a structured ask_user_question tool. It opens each Ask inside the pi TUI. One Ask holds one to four Questions. Each Question holds a header, a question, two to four options, and an automatic Other row. Users can answer with a single option, multiple options, or free text.

### Controls and flow

The TUI shows Options, Other, and a help row with key bindings. Users move with up and down, read long text with page keys, toggle multi-select with space, and confirm with enter. Escape leaves Other or cancels the Ask. For multi-question Asks, the UI advances to the next unanswered Question and lets users revisit earlier Answers. Terminal safety logic strips ANSI, control codes, and bidi characters from model text while keeping CJK, emoji, and accents.

### TUI-only design

The tool works only in the pi TUI. RPC and headless modes return a clear error with no fallback answer. This choice avoids silent defaults. See ADR 0001 and ADR 0002 for details. A transcript renderer shows chips, question text, and resolved Answers instead of raw JSON.

[github.com/jyooi/pi-ask-user-question](https://github.com/jyooi/pi-ask-user-question)
