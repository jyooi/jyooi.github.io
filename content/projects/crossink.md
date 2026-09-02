---
title: "CrossInk"
type: page
summary: "E-reader firmware for the Xteink X4 with Simplified and Traditional Chinese EPUB support, rebased onto each upstream CrossInk release."
active: true
repo: "https://github.com/jyooi/CrossInk"
weight: 3
---

### Chinese EPUBs on an ESP32 e-reader

[CrossInk](https://github.com/jyooi/CrossInk) is my fork of [uxjulia/CrossInk](https://github.com/uxjulia/CrossInk), itself a fork of [CrossPoint Reader](https://github.com/crosspoint-reader/crosspoint-reader).
The firmware runs on the Xteink X3, Xteink X4, and Seeed Studio Sticky.
My fork adds Simplified and Traditional Chinese EPUB reading for the Xteink X4.

### What the fork adds

- SD-card CJK fonts: LXGW WenKai for Simplified and LXGW WenKai TC for Traditional Chinese.
- CJK typography: correct first-line indents and standard line-break rules for Chinese and Japanese text.
- Chinese UI languages: zh-Hans and zh-Hant in the Settings menu.
- Fast page turns: a larger glyph cache stops repeat SD-card reads for missed glyphs.

The device is an ESP32-C3 with limited RAM, so the glyph cache size is a direct trade between page-turn speed and heap headroom.
Device heap verification is in progress, and the repository tracks a checklist for it.

### Why a fork and not a pull request

Upstream does not accept pull requests.
The Chinese patches rebase onto each upstream release instead.
Releases from this fork install through the SD card firmware update path.
Everything else, from the Lexend Deca and Bitter reader fonts to reading stats and progress sync, comes from uxjulia's fork unchanged.

[github.com/jyooi/CrossInk](https://github.com/jyooi/CrossInk)
