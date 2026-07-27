// PLATFORM / SRE VARIANT.
// Emphasis: Kubernetes, delivery pipelines, load testing, resource profiling,
// fleet operations. Frontend framework detail is deliberately compressed.
// Build: typst compile resume/sre.typ build/JiaYi_Ooi_Resume_Platform.pdf

#import "lib.typ": *
#show: resume

#header[Software Engineer - Platform & Reliability]

#section("Summary")
Engineer with 8+ years building and operating production services, the last 5+ fully remote for teams in Singapore, the US, and Australia. Ran the real-time messaging service behind a 100k-messages-a-day inbox on Kubernetes, load-tested it to 100k concurrent connections, and have a track record of fixing what production actually breaks on - memory exhaustion, slow pipelines, manual deploys. Currently studying for the Certified Kubernetes Administrator exam. Available worldwide as a contractor through my own registered entity, or as a direct hire with relocation.

#section("Languages & Technologies")
#grid(
  columns: (auto, 1fr),
  column-gutter: 0.6em,
  row-gutter: 0.38em,
  [*Infrastructure:*], [Kubernetes, Docker, Helm, Terraform, Linux, Nginx],
  [*Observability:*], [Prometheus, Grafana, load testing, memory profiling],
  [*CI/CD:*], [GitHub Actions, Git, build pipeline optimisation, over-the-air release pipelines],
  [*Languages:*], [Python, TypeScript, SQL, Elixir],
  [*Backend:*], [FastAPI, PostgreSQL, REST API design, real-time systems],
)

#section("Experience")

#role("Career development sabbatical", "Apr 2026 – Present")
- Studying for the Certified Kubernetes Administrator (CKA) exam, deepening Kubernetes and platform tooling.
- Built #link("https://github.com/jyooi/elixir-opentui")[elixir-opentui], a terminal UI framework for Elixir with a Zig NIF backend - systems-level work on rendering, double buffering, and native interop.

#role("uchat", "Nov 2024 – Apr 2026")
#subrole("Senior Software Engineer, Business unit", "Remote (Singapore)")
#context-line[Business inbox of uchat, a consumer messaging app in Thailand; 500+ companies run their B2C conversations on it.]
- Load-tested the chat service to 100k concurrent connections ahead of traffic growth, establishing the capacity envelope before customer traffic reached it.
- Ran the real-time messaging service on Kubernetes, processing 100k+ customer messages a day for 500+ business accounts on a FastAPI backend.
- Built the frontend the service is consumed through (React, TypeScript, Socket.IO) and reviewed the team's work on it.

#role("Accomy", "Feb 2024 – Oct 2024")
#subrole("Senior Software Engineer", "Remote (Singapore)")
- Led 2 frontend engineers to ship a corporate hotel booking MVP in 4 months, from empty repo to launch.

#role("Coinalpha (Hummingbot)", "Jun 2021 – Nov 2023")
#subrole("Software Engineer", "Remote (US)")
#context-line[Hummingbot is an open-source market-making framework for crypto trading bots.]
- Fixed memory leaks that exhausted 8 GB machines within hours - cut steady-state memory \~90% and eliminated freezes in long-running trading sessions.
- Halved CI build times by restructuring the build pipeline.
- Built the React + FastAPI liquidity mining platform used by \~1,000 bot operators facilitating \~\$100k in daily trading volume.

#role("Areca System", "2020 – 2021")
#subrole("Contract Software Engineer", "Penang, Malaysia")
- Designed the over-the-air update pipeline that let every in-store terminal across a 30-store chain update automatically, replacing manual on-site visits.
- Built the Electron point-of-sale system those terminals ran - cashier UI, transaction flows, e-wallet payments.

#role("Aglive", "2017 – 2020")
#subrole("Software Engineer", "Remote (Australia)")
- Built and operated the tracking dashboard covering 500+ trucks and buses on the Austracker platform.
- Led deduplication of multi-million-row GPS data, removing \~25% duplicate records that fed customer reports.

#education("B.IT Communications & Networking (Hons), Universiti Tunku Abdul Rahman", "May 2017")
