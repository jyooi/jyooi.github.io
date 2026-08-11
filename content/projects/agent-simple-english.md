---
title: "agent-simple-english"
type: page
summary: "A deterministic ASD-STE100 linter with one Engine, one CLI, and adapters for pi and Claude Code that gate writes, edits, commits, and replies."
active: true
repo: "https://github.com/jyooi/agent-simple-english"
weight: 10
---

### Deterministic STE checks for AI agents

[agent-simple-english](https://github.com/jyooi/agent-simple-english) checks text against ASD-STE100 Simplified Technical English and two house-style rules. It reports exact line, column, and rule ID with a suggested correction. It does not rewrite text.

### One Engine, four surfaces

The package ships one Engine, one CLI, a pi adapter, and a Claude Code adapter. The Engine scans Markdown and code comments and applies nine rules. The dictionary covers contractions, hedging, marketing, phrasal verbs, and STE approved words. The tagger and markdown parser keep checks fast and precise.

### How the pi adapter gates work

The pi adapter adds active rules to the prompt and gates tool calls. It blocks writes and edits with hard violations and warns on soft violations. It blocks static git commit messages with hard violations. It also checks replies and can run in strict mode through the say tool. The Claude Code adapter uses Hook mode to enforce the same rules at SessionStart, PreToolUse, and Stop.

### Why no auto-fix

Automatic rewrites can change meaning. The tool reports problems and leaves the fix to the author. This keeps technical text accurate.

[github.com/jyooi/agent-simple-english](https://github.com/jyooi/agent-simple-english)
