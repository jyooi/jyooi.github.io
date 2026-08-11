// FULL-STACK VARIANT - the general-purpose cut, published on jyooi.com.
// Emphasis: product delivery, typed component systems, real-time frontends.
// Build: typst compile resume/fullstack.typ static/JiaYi_Ooi_Resume.pdf

#import "lib.typ": *
#show: resume

#header[Senior Full-Stack Engineer]

#section("Summary")
Senior full-stack engineer with 8+ years of experience. Last 5+ years remote with teams in Singapore, the United States and Australia. Builds typed UI component systems and the real-time services that support them. Recent work is the uchat Business inbox.

The inbox handles 100k+ messages per day with React and TypeScript and FastAPI on Kubernetes. Works worldwide as a contractor through my registered company. Also accepts direct employment with relocation.

#section("Languages & Technologies")
<!-- ste-disable-next-line sentence-length -->
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
- Built #link("https://github.com/jyooi/elixir-opentui")[elixir-opentui], an open-source terminal UI framework for Elixir.
- Built #link("https://github.com/jyooi/agent-simple-english")[agent-simple-english], a linter for Simplified Technical English.
- Built #link("https://github.com/jyooi/pi-ask-user-question")[pi-ask-user-question], a pi extension for structured user questions.
- Prepares for the Certified Kubernetes Administrator examination.

#role("uchat", "Nov 2024 – Apr 2026")
#subrole("Senior Software Engineer, Business unit", "Remote (Singapore)")
#context-line[Business inbox of uchat, a consumer messaging app in Thailand. More than 500 companies run their B2C conversations on it.]
- Shipped the real-time inbox that handles 100k+ messages per day for 500+ business accounts. The system uses React and TypeScript and FastAPI on Kubernetes.
- Built a strongly typed UI component system for the inbox. The system gives the team a shared vocabulary for new screens.
- Tested the chat service to 100k concurrent connections before traffic growth.
- Reviewed the team frontend work and defined feature scope with product and design.

<!-- ste-disable-next-line sentence-length -->
#role("Accomy", "Feb 2024 – Oct 2024")
#subrole("Senior Software Engineer", "Remote (Singapore)")
- Led 2 frontend engineers and shipped the MVP of a corporate hotel booking platform in 4 months. Started from an empty repository and released the product.
- Created the Next.js and TypeScript codebase as a new project. Mentored 2 engineers on the codebase and made architecture decisions with product and design.

#role("Coinalpha (Hummingbot)", "Jun 2021 – Nov 2023")
#subrole("Software Engineer", "Remote (US)")
#context-line[Hummingbot is an open-source market-making framework for crypto trading bots.]
- Built the React and FastAPI liquidity mining platform that about 1,000 bot operators use. They help with about \$100k in daily trading volume.
- Built and published #link("https://github.com/hummingbot/hbui")[\@hummingbot/hbui], the Hummingbot design system. The system syncs design tokens from Figma into a Tailwind and React package that teams use for frontends.
- Fixed memory leaks that exhausted 8 GB machines within hours. The fix cut steady-state memory by about 90 percent.

#role("Areca System", "2020 – 2021")
#subrole("Contract Software Engineer", "Penang, Malaysia")
- Built an Electron point-of-sale system for a 30-store supermarket chain.

#role("Aglive", "2017 – 2020")
#subrole("Software Engineer", "Remote (Australia)")
- Built and operated the tracking dashboard on the Austracker platform. The dashboard covers 500+ trucks and buses.
- Led deduplication of multi-million-row GPS data and removed about 25 percent duplicate records from customer reports.

#section("Projects")
- #link("https://github.com/jyooi/elixir-opentui")[*elixir-opentui*] - terminal UI framework for Elixir with a Zig NIF backend. It uses Elm-inspired architecture, a declarative View DSL, and 15+ widgets with double-buffered render.

#education("B.IT Communications and Networking (Hons), Universiti Tunku Abdul Rahman", "May 2017")
