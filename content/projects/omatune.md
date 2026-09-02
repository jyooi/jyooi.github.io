---
title: "omatune"
type: page
summary: "Music sync for classic iPods on Linux and macOS. It writes the database the stock firmware reads, transcodes FLAC to ALAC, and ships as one binary."
active: true
repo: "https://github.com/jyooi/omatune"
weight: 2
---

### Keep an old iPod alive

[omatune](https://github.com/jyooi/omatune) syncs music to classic iPods after Apple dropped support.
It runs on Linux and macOS and writes the database the stock iPod firmware reads.
It covers iPod classic, nano 1G to 4G, video, and mini.
The iPod classic 120 GB (2008) is verified on a reference device.
The other models in that group use the same database format and signature scheme, so they are expected to work.
Newer models with the sqlite database and the hash72 or hashAB signature are out of scope.

### What a sync does

Config lives in a TOML file with a library path and a table for each device.
Each device has its own selection file with include and exclude rules.
The planner reads the device ledger, applies the rules, and prints a sync plan before anything changes.
A sync copies tracks, converts FLAC to ALAC on the way, signs the database, and reads play counts back into local play data.
The report always states whether the device is ejected and safe to unplug.
A wipe needs the typed word `wipe`.

### How it is built

The repository is a bun workspace in TypeScript.
The `device-database` package holds the model table, the database codec, and the hash58 signer.
The `platform` package is the only hardware seam, with a Linux layer, a fake layer for tests, and a stub layer.
The `core` package holds the scanner, rule evaluation, the ledger reader, the planner, and sync.
The `transcode` package wraps libFLAC and Apple ALAC in a wasm module.
The `tui` package holds the selection screen, sync plan, progress, report, and device screen.
Each release is one binary per platform, so the host does not need bun.

[github.com/jyooi/omatune](https://github.com/jyooi/omatune)
