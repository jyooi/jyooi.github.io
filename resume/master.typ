// MASTER RESUME - never send this file to anyone.
// It is the superset every one-page variant is cut down from, per the course's
// "create a master version, then create a version for the specific job" rule.
// Build: typst compile resume/master.typ build/master.pdf

#import "lib.typ": *
#show: resume

#header[Senior Full-Stack Engineer]

#section("Summary")
Senior full-stack engineer with 8+ years' experience, the last 5+ fully remote for teams in Singapore, the US, and Australia. Builds typed UI component systems and the real-time services behind them - most recently the Uchat Business platform, processing 100k+ messages a day on React/TypeScript and FastAPI on Kubernetes. Available worldwide as a contractor through my own registered entity, or as a direct hire with relocation.

#section("Languages & Technologies")
#grid(
  columns: (auto, 1fr),
  column-gutter: 0.6em,
  row-gutter: 0.38em,
  [*Languages:*], [TypeScript, Python, Elixir, SQL],
  [*Frontend:*], [React, Next.js, Vite, TanStack Router, React Query, Socket.IO, Electron, Playwright, Vitest],
  [*Backend:*], [FastAPI, PostgreSQL, REST API design, load testing],
  [*Infrastructure:*], [Kubernetes, Docker, Helm, Terraform, Linux, Nginx, GitHub Actions, Prometheus, Grafana, Git],
  [*Other:*], [Design systems, real-time systems, Web3 wallets (MetaMask, Tezos)],
)

#section("Experience")

#role("Career development sabbatical", "Apr 2026 – Present")
- Built #link("https://github.com/jyooi/elixir-opentui")[elixir-opentui] - see Projects.
- Built #link("https://github.com/jyooi/agent-simple-english")[agent-simple-english], a deterministic ASD-STE100 linter with Engine, CLI, and adapters for pi and Claude Code.
- Built #link("https://github.com/jyooi/pi-ask-user-question")[pi-ask-user-question], a pi TUI extension that lets agents ask structured multi-question decisions.
- Prepare for the Certified Kubernetes Administrator (CKA) exam and deepen Kubernetes and platform tooling.

#role("Uchat", "Nov 2024 – Apr 2026")
#subrole("Senior Software Engineer, Business unit", "Remote (Singapore)")
#context-line[Business platform of Uchat, a consumer messaging app in Thailand. 500+ companies run their B2C conversations on it.]
- Shipped the real-time platform that processes 100k+ customer messages a day for 500+ business accounts, across a React + TypeScript frontend (Vite, TanStack Router, Socket.IO) and a FastAPI backend on Kubernetes.
- Built the strongly-typed UI component system the platform is assembled from, giving the team a shared vocabulary for new screens and cutting per-screen boilerplate.
- Built an image cropping component adopted by the company's internal tooling.
- Load-tested the chat service to 100k concurrent connections ahead of traffic growth.
- Reviewed the team's frontend work and shaped feature scope directly with product and design.

#role("Accomy", "Feb 2024 – Oct 2024")
#subrole("Senior Software Engineer", "Remote (Singapore)")
- Led 2 frontend engineers to ship the MVP of a corporate hotel booking platform in 4 months, from empty repo to launch.
- Established the Next.js + TypeScript codebase from scratch - file structure, component patterns, review conventions - mentored 2 engineers onto it, and drove architecture decisions with product and design.

#role("Coinalpha (Hummingbot)", "Jun 2021 – Nov 2023")
#subrole("Software Engineer", "Remote (US)")
#context-line[Hummingbot is an open-source market-making framework for crypto trading bots.]
- Built the React + FastAPI liquidity mining platform used by \~1,000 bot operators facilitating \~\$100k in daily trading volume.
- Built and published #link("https://github.com/hummingbot/hbui")[\@hummingbot/hbui], the Hummingbot design system - design tokens synced from Figma into a Tailwind + React package consumed across the organisation's frontends.
- Fixed memory leaks that exhausted 8 GB machines within hours - cut steady-state memory \~90% and eliminated browser freezes in long-running trading sessions.
- Halved CI build times by restructuring the build pipeline.
- Integrated MetaMask and Tezos wallets so operators could sign on-chain transactions directly from the UI.

#role("Areca System", "2020 – 2021")
#subrole("Contract Software Engineer", "Penang, Malaysia")
- Built an Electron point-of-sale system from scratch for a 30-store nationwide supermarket chain - cashier UI, transaction flows, e-wallet payments.
- Designed the over-the-air update pipeline that let every in-store terminal update automatically, replacing manual on-site visits.

#role("Aglive", "2017 – 2020")
#subrole("Software Engineer", "Remote (Australia)")
- Built and operated the tracking dashboard covering 500+ trucks and buses on the Austracker platform.
- Led deduplication of multi-million-row GPS data, removing \~25% duplicate records that fed customer reports.

#section("Projects")
- #link("https://github.com/jyooi/elixir-opentui")[*elixir-opentui*] - a terminal UI framework for Elixir with a high-performance Zig NIF backend. Elm-inspired init/handle_event/render architecture with a declarative View DSL, 15+ widgets, and flexbox layout. Zig NIFs handle double-buffered rendering, frame diffing, and rope text structures, with a pure-Elixir fallback so the native build stays optional.
- #link("https://github.com/jyooi/agent-simple-english")[*agent-simple-english*] - a deterministic ASD-STE100 linter. One Engine, one CLI, and adapters for pi and Claude Code. The Engine scans Markdown and code comments and applies nine rules with dictionary support.
- #link("https://github.com/jyooi/pi-ask-user-question")[*pi-ask-user-question*] - a pi TUI extension for structured agent questions. One Ask holds one to four Questions with multi-select and Other support. It runs TUI-only with terminal safety and transcript rendering.

#education("B.IT Communications & Networking (Hons), Universiti Tunku Abdul Rahman", "May 2017")
