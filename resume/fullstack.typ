// FULL-STACK VARIANT - the general-purpose cut, published on jyooi.com.
// Emphasis: product delivery, typed component systems, real-time frontends.
// Build: typst compile resume/fullstack.typ static/JiaYi_Ooi_Resume.pdf

#import "lib.typ": *
#show: resume

#header[Senior Full-Stack Engineer]

#section("Summary")
Senior full-stack engineer, 8+ years, the last 5+ fully remote for teams in Singapore, the US, and Australia. Builds typed UI component systems and the real-time services behind them - most recently the uchat Business inbox, 100k+ messages a day on React/TypeScript and FastAPI on Kubernetes. Available worldwide as a contractor via my own registered entity, or direct with relocation.

#section("Languages & Technologies")
#grid(
  columns: (auto, 1fr),
  column-gutter: 0.6em,
  row-gutter: 0.38em,
  [*Languages:*], [TypeScript, Python, Elixir, SQL],
  [*Frontend:*], [React, Next.js, Vite, TanStack Router, React Query, Socket.IO, Electron, Playwright, Vitest],
  [*Backend:*], [FastAPI, PostgreSQL, REST API design, load testing],
  [*Infrastructure:*], [Kubernetes, Docker, CI/CD (GitHub Actions), Linux, Git],
  [*Other:*], [Design systems, real-time systems, Web3 wallets (MetaMask, Tezos)],
)

#section("Experience")

#role("Career development sabbatical", "Apr 2026 – Present")
- Built #link("https://github.com/jyooi/elixir-opentui")[elixir-opentui], an open-source terminal UI framework for Elixir - see Projects.
- Studying for the Certified Kubernetes Administrator (CKA) exam, deepening Kubernetes and platform tooling.

#role("uchat", "Nov 2024 – Apr 2026")
#subrole("Senior Software Engineer, Business unit", "Remote (Singapore)")
#context-line[Business inbox of uchat, a consumer messaging app in Thailand; 500+ companies run their B2C conversations on it.]
- Shipped the real-time inbox processing 100k+ messages a day for 500+ business accounts - React/TypeScript (Vite, TanStack Router, Socket.IO) over FastAPI on Kubernetes.
- Built the strongly-typed UI component system the inbox is assembled from, giving the team a shared vocabulary for new screens.
- Load-tested the chat service to 100k concurrent connections ahead of traffic growth.
- Reviewed the team's frontend work and shaped feature scope directly with product and design.

#role("Accomy", "Feb 2024 – Oct 2024")
#subrole("Senior Software Engineer", "Remote (Singapore)")
- Led 2 frontend engineers to ship the MVP of a corporate hotel booking platform in 4 months, from empty repo to launch.
- Established the Next.js + TypeScript codebase from scratch, mentored 2 engineers onto it, and drove architecture decisions with product and design.

#role("Coinalpha (Hummingbot)", "Jun 2021 – Nov 2023")
#subrole("Software Engineer", "Remote (US)")
#context-line[Hummingbot is an open-source market-making framework for crypto trading bots.]
- Built the React + FastAPI liquidity mining platform used by \~1,000 bot operators facilitating \~\$100k in daily trading volume.
- Built and published #link("https://github.com/hummingbot/hbui")[\@hummingbot/hbui], the Hummingbot design system - design tokens synced from Figma into a Tailwind + React package consumed across the organisation's frontends.
- Fixed memory leaks that exhausted 8 GB machines within hours, cutting steady-state memory \~90%.

#role("Areca System", "2020 – 2021")
#subrole("Contract Software Engineer", "Penang, Malaysia")
- Built an Electron point-of-sale system from scratch for a 30-store supermarket chain.

#role("Aglive", "2017 – 2020")
#subrole("Software Engineer", "Remote (Australia)")
- Built and operated the tracking dashboard covering 500+ trucks and buses on the Austracker platform.
- Led deduplication of multi-million-row GPS data, removing \~25% duplicate records that fed customer reports.

#section("Projects")
- #link("https://github.com/jyooi/elixir-opentui")[*elixir-opentui*] - terminal UI framework for Elixir with a Zig NIF backend: Elm-inspired architecture, declarative View DSL, 15+ widgets, double-buffered rendering.

#education("B.IT Communications & Networking (Hons), Universiti Tunku Abdul Rahman", "May 2017")
