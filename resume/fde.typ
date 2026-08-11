// FORWARD DEPLOYED ENGINEER VARIANT.
// Emphasis: end-to-end ownership, unfamiliar stacks, work with
// customers, product and design, remote self-sufficiency, ship to deadline.
// Build: typst compile resume/fde.typ build/JiaYi_Ooi_Resume_FDE.pdf

#import "lib.typ": *
#show: resume

#header[Forward Deployed / Full-Stack Engineer]

#section("Summary")
Engineer with 8+ years of end-to-end product delivery. Last 5+ years remote with Singapore, United States, and Australian teams. Works directly with product, design, and customers, not behind a ticket queue. Built an empty repository into a launched MVP in 4 months. Built a point-of-sale system for a 30-store retail chain.

Owned real-time messaging at 100k+ messages per day. Adapts to new stacks and contributes quickly. Works worldwide as a contractor through my registered company. Also accepts direct employment with relocation.

#section("Languages & Technologies")
<!-- ste-disable-next-line sentence-length -->
#grid(
  columns: (auto, 1fr),
  column-gutter: 0.6em,
  row-gutter: 0.38em,
  [*Languages:*], [TypeScript, Python, Elixir, SQL],
  [*Product stack:*], [React, Next.js, FastAPI, PostgreSQL, Electron, Socket.IO],
  [*Infrastructure:*], [Kubernetes, Docker, Linux, CI/CD (GitHub Actions), Terraform],
  [*Domains:*], [Real-time messaging, retail point-of-sale, crypto trading, fleet tracking, travel booking],
)

#section("Experience")

#role("Career development sabbatical", "Apr 2026 – Present")
- Built #link("https://github.com/jyooi/elixir-opentui")[elixir-opentui], a terminal UI framework for Elixir with a Zig NIF backend. Learned two new languages to build it.
- Built #link("https://github.com/jyooi/agent-simple-english")[agent-simple-english], a linter for Simplified Technical English.
- Built #link("https://github.com/jyooi/pi-ask-user-question")[pi-ask-user-question], a pi extension for structured user questions.
- Prepares for the Certified Kubernetes Administrator examination.

#role("uchat", "Nov 2024 – Apr 2026")
#subrole("Senior Software Engineer, Business unit", "Remote (Singapore)")
#context-line[Business inbox of uchat, a consumer messaging app in Thailand. More than 500 companies run their B2C conversations on it.]
- Shipped the real-time inbox that handles 100k+ customer messages per day for 500+ businesses.
- Defined feature scope with product and design and reviewed team frontend work.
- Built a strongly typed component system for the product. New screens ship without rebuilding basics.

<!-- ste-disable-next-line sentence-length -->
#role("Accomy", "Feb 2024 – Oct 2024")
#subrole("Senior Software Engineer", "Remote (Singapore)")
- Took a corporate hotel booking platform from empty repository to launched MVP in 4 months. Led 2 frontend engineers.
- Defined the Next.js and TypeScript architecture. Mentored 2 engineers and made design decisions with product and design.

#role("Coinalpha (Hummingbot)", "Jun 2021 – Nov 2023")
#subrole("Software Engineer", "Remote (US)")
#context-line[Hummingbot is an open-source market-making framework for crypto trading bots.]
- Built the liquidity mining platform that about 1,000 bot operators use. They help with about \$100k in daily trading volume. Learned the market-making domain from zero.
- Integrated MetaMask and Tezos wallets so operators can sign on-chain transactions from the UI.
- Fixed memory leaks that exhausted 8 GB machines within hours. The fix cut steady-state memory by about 90 percent.

#role("Areca System", "2020 – 2021")
#subrole("Contract Software Engineer", "Penang, Malaysia")
- Built an Electron point-of-sale system for a 30-store supermarket chain. Built for real cashiers and in-store hardware.
- Designed an over-the-air update pipeline. The pipeline updates every terminal automatically and removes manual on-site visits.

#role("Aglive", "2017 – 2020")
#subrole("Software Engineer", "Remote (Australia)")
- Built and operated the tracking dashboard on the Austracker platform. The dashboard covers 500+ trucks and buses.
- Led deduplication of multi-million-row GPS data and removed about 25 percent duplicate records from customer reports.

#education("B.IT Communications and Networking (Hons), Universiti Tunku Abdul Rahman", "May 2017")
