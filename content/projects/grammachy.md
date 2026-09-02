---
title: "grammachy"
type: page
summary: "An offline grammar and spelling checker for Omarchy. Highlight text, press a hotkey, review each fix in a popup, and apply the result through the clipboard."
active: true
repo: "https://github.com/jyooi/grammachy"
weight: 1
---

### A grammar check that runs only when you ask

[grammachy](https://github.com/jyooi/grammachy) is an Omarchy plugin that checks grammar and spelling on demand.
Highlight text in any application and press SUPER + SHIFT + Q.
A popup marks each issue in the selection.
You accept or skip each fix, then apply the corrected text through the clipboard.
For longer text, SUPER + ALT + Q opens a Compose window that checks a draft in chunks.

Grammachy never checks while you type.
Each check is an explicit trigger.
No engine sends text off the machine.

### Two engines, one honest trade

Harper is the default engine.
It runs in process through `harper-core`, compiles into the binary, and needs no download.
LanguageTool is opt in from Settings.
It needs a 250 MB download, a Java runtime, and about 1 GB of resident memory.

Harper catches about one in eight learner errors with zero false positives.
LanguageTool catches about one in seven.
That small gap is why LanguageTool stays opt in.
There is no automatic fallback between engines.
An engine that cannot answer says so, and you switch.

### How it fits into Omarchy

The plugin is a Rust CLI plus a QML bar widget.
The `omarchy plugin add` command clones the repository and validates it, and nothing else.
The bar widget shows the pinned companion binary and its sha256 before you install it.
The `setup` command writes the two hotkeys into the Hyprland bindings file and reloads Hyprland.
The `doctor` command lists each system package and its state and installs nothing.
No step needs sudo.

[github.com/jyooi/grammachy](https://github.com/jyooi/grammachy)
