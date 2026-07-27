// Resume source for JiaYi_Ooi_Resume.pdf
// Build: typst compile resume/resume.typ static/JiaYi_Ooi_Resume.pdf
// Content follows the ByteByteGo "Tech Resume Inside Out" guidance:
// one number per bullet, dates hard right, skills above experience,
// education last, strict one page.

#let accent = rgb("#2c4a6e")

#set page(paper: "a4", margin: (x: 1.5cm, y: 1.25cm))
#set text(font: "Libertinus Serif", size: 9.7pt)
#set par(leading: 0.48em)
#show link: set text(fill: accent)

#let section(title) = {
  v(0.6em)
  text(fill: accent, weight: "bold", size: 9pt, tracking: 0.08em, upper(title))
  v(-0.8em)
  line(length: 100%, stroke: 1pt + accent)
  v(-0.35em)
}

#let role(company, dates) = {
  v(0.32em)
  grid(
    columns: (1fr, auto),
    text(weight: "bold", size: 10.8pt, company),
    text(fill: luma(70), dates),
  )
}

#let subrole(title, location) = {
  v(-0.55em)
  grid(
    columns: (1fr, auto),
    text(style: "italic", size: 9.8pt, title),
    text(style: "italic", size: 9.8pt, fill: luma(70), location),
  )
  v(-0.3em)
}

#set list(indent: 0.6em, body-indent: 0.45em, spacing: 0.46em)

// Header
#align(center)[
  #text(size: 19pt, weight: "bold")[Jia Yi Ooi]

  #v(-0.5em)
  #text(size: 10.5pt, fill: luma(60))[Senior Full-Stack Engineer]

  #v(-0.35em)
  #text(size: 9pt)[
    Penang, Malaysia (UTC+8) · Open to remote and relocation · #link("mailto:me@jyooi.com")[me\@jyooi.com]
  ]

  #v(-0.55em)
  #text(size: 9pt)[
    #link("https://www.linkedin.com/in/jia-yi-ooi-564a90111/")[LinkedIn] ·
    #link("https://github.com/jyooi")[GitHub] ·
    #link("https://jyooi.com")[jyooi.com]
  ]
]

#section("Summary")
Senior full-stack engineer with 8+ years' experience, the last 5+ fully remote for teams in Singapore, the US, and Australia. Most recently built real-time messaging for uchat Business, a B2C customer-conversation inbox processing 100k+ messages a day, on React/TypeScript and FastAPI on Kubernetes. Contributor to the open-source Hummingbot ecosystem. Deepening platform/SRE skills - Kubernetes CKA in progress.

#section("Languages & Technologies")
#grid(
  columns: (auto, 1fr),
  column-gutter: 0.6em,
  row-gutter: 0.38em,
  [*Languages:*], [TypeScript, Python, Elixir, SQL],
  [*Frontend:*], [React, Next.js, Vite, TanStack Router, React Query, Socket.IO, Electron],
  [*Backend & Infra:*], [FastAPI, Kubernetes, CI/CD, REST API design, load testing],
  [*Other:*], [Web3 wallets (MetaMask, Tezos), real-time systems],
)

#section("Experience")

#role("Career development sabbatical", "Apr 2026 – Present")
- Preparing for the Certified Kubernetes Administrator (CKA) exam; deepening SRE and platform tooling.
- Building #link("https://github.com/jyooi/elixir-opentui")[*elixir-opentui*], a hobby project porting a TypeScript terminal UI library to Elixir - reimplementing its rendering loop on BEAM processes.

#role("uchat", "Nov 2024 – Apr 2026")
#subrole("Senior Software Engineer, Business unit", "Remote (Singapore)")
#v(-0.05em)
#text(size: 9.5pt, style: "italic", fill: luma(60))[Business inbox of uchat, a consumer messaging app in Thailand; 500+ companies run their B2C conversations on it.]
- Shipped the real-time inbox that processes 100k+ customer messages a day, as one of 4 engineers across the React + TypeScript frontend (Vite, TanStack Router, Socket.IO) and FastAPI backend on Kubernetes.
- Load-tested the chat service to 100k concurrent connections, surfacing bottlenecks before customer traffic scaled into them.

#role("Accomy", "Feb 2024 – Oct 2024")
#subrole("Senior Software Engineer", "Remote (Singapore)")
- Led 2 frontend engineers to ship the MVP of a corporate hotel booking platform in 4 months, from empty repo to launch.
- Established the Next.js + TypeScript codebase from scratch - file structure, component patterns, review conventions - mentored 2 engineers onto it, and drove architecture decisions with product and design.

#role("Coinalpha (Hummingbot)", "Jun 2021 – Nov 2023")
#subrole("Software Engineer", "Remote (US)")
- Built the React + FastAPI liquidity mining platform for Hummingbot, the open-source market-making framework, used by \~1,000 bot operators facilitating \~\$100k in daily trading volume.
- Fixed memory leaks that exhausted 8 GB machines within hours - cut steady-state memory \~90% and eliminated browser freezes in long-running trading sessions.
- Halved CI build times by restructuring the build pipeline.
- Integrated MetaMask and Tezos wallets so operators could sign on-chain transactions directly from the UI.

#role("Areca System", "Jul 2020 – May 2021")
#subrole("Contract Software Engineer", "Penang, Malaysia")
- Built an Electron point-of-sale system from scratch for a 30-store nationwide supermarket chain - cashier UI, transaction flows, e-wallet payments.
- Designed the over-the-air update pipeline that let every in-store terminal update automatically, replacing manual on-site visits.

#role("Aglive", "Nov 2017 – Jun 2020")
#subrole("Software Engineer", "Remote (Australia)")
- Built and operated the tracking dashboard covering 500+ trucks and buses on the Austracker platform.
- Led deduplication of multi-million-row GPS data, removing \~25% duplicate records that fed customer reports.

#section("Education")
#role("B.IT Communications & Networking (Hons), Universiti Tunku Abdul Rahman", "May 2017")
