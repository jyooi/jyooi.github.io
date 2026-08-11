// FORWARD DEPLOYED ENGINEER VARIANT.
// Emphasis: end-to-end ownership, unfamiliar stacks, working directly with
// customers, product and design, remote self-sufficiency, shipping to deadline.
// Build: typst compile resume/fde.typ build/JiaYi_Ooi_Resume_FDE.pdf

#import "lib.typ": *
#show: resume

#header[Forward Deployed / Full-Stack Engineer]

#section("Summary")
Engineer with 8+ years shipping products end to end, the last 5+ fully remote across Singapore, US, and Australian teams - working straight with product, design, and customers rather than behind a ticket queue. Has taken an empty repo to a launched MVP in 4 months, built a point-of-sale system deployed to a 30-store retail chain, and owned real-time messaging at 100k+ messages a day. Comfortable landing in an unfamiliar stack and being useful in it quickly. Available worldwide as a contractor through my own registered entity, or as a direct hire with relocation.

#section("Languages & Technologies")
#grid(
  columns: (auto, 1fr),
  column-gutter: 0.6em,
  row-gutter: 0.38em,
  [*Languages:*], [TypeScript, Python, Elixir, SQL],
  [*Product stack:*], [React, Next.js, Node.js, FastAPI, PostgreSQL, Electron, Socket.IO],
  [*Infrastructure:*], [Kubernetes, Docker, Linux, CI/CD (GitHub Actions), Terraform],
  [*Domains:*], [Real-time messaging, retail point-of-sale, crypto trading, fleet tracking, travel booking],
)

#section("Experience")

#role("Career development sabbatical", "Apr 2026 – Present")
- Built #link("https://github.com/jyooi/elixir-opentui")[elixir-opentui], a terminal UI framework for Elixir with a Zig NIF backend - picked up two unfamiliar languages to build it.
- Built #link("https://github.com/jyooi/agent-simple-english")[agent-simple-english], a deterministic ASD-STE100 linter with Engine, CLI, and adapters for pi and Claude Code.
- Built #link("https://github.com/jyooi/pi-ask-user-question")[pi-ask-user-question], a pi TUI extension that lets agents ask structured multi-question decisions.
- Prepare for the Certified Kubernetes Administrator (CKA) exam.

#role("Uchat", "Nov 2024 – Apr 2026")
#subrole("Senior Software Engineer, Business unit", "Remote (Singapore)")
#context-line[Business platform of Uchat, a consumer messaging app in Thailand. 500+ companies run their B2C conversations on it.]
- Shipped the real-time platform that processes 100k+ customer messages a day for the 500+ businesses running their customer conversations on it.
- Shaped feature scope directly with product and design, and reviewed the team's frontend work.
- Built the strongly-typed component system the product is assembled from, so new screens ship without rebuilding the basics.

#role("Accomy", "Feb 2024 – Oct 2024")
#subrole("Senior Software Engineer", "Remote (Singapore)")
- Took a corporate hotel booking platform from empty repo to launched MVP in 4 months, leading 2 frontend engineers.
- Set the Next.js + TypeScript architecture, mentored 2 engineers onto it, and drove design decisions jointly with product and design.

#role("Coinalpha (Hummingbot)", "Jun 2021 – Nov 2023")
#subrole("Software Engineer", "Remote (US)")
#context-line[Hummingbot is an open-source market-making framework for crypto trading bots.]
- Built the liquidity mining platform used by \~1,000 bot operators facilitating \~\$100k in daily trading volume, learning the market-making domain from scratch.
- Integrated MetaMask and Tezos wallets so operators could sign on-chain transactions directly from the UI.
- Fixed memory leaks that exhausted 8 GB machines within hours - cut steady-state memory \~90%.

#role("Areca System", "Jul 2020 – May 2021")
#subrole("Contract Software Engineer", "Penang, Malaysia")
- Built an Electron point-of-sale system from scratch for a 30-store nationwide supermarket chain, working to the constraints of real cashiers and in-store hardware.
- Designed the over-the-air update pipeline that let every terminal update automatically, replacing manual on-site visits.

#role("Aglive", "Nov 2017 – Jun 2020")
#subrole("Software Engineer", "Remote (Australia)")
- Built and operated the tracking dashboard covering 500+ trucks and buses on the Austracker platform.
- Led deduplication of multi-million-row GPS data, removing \~25% duplicate records that fed customer reports.

#education("B.IT Communications & Networking (Hons), Universiti Tunku Abdul Rahman", "May 2017")
