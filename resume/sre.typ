// PLATFORM / SRE VARIANT.
// Emphasis: Kubernetes, delivery pipelines, load testing, resource profiling,
// fleet operations. Frontend framework detail uses compressed form.
// Build: typst compile resume/sre.typ build/JiaYi_Ooi_Resume_Platform.pdf

#import "lib.typ": *
#show: resume

#header[Software Engineer - Platform & Reliability]

#section("Summary")
Engineer with 8+ years of building and operating production services. Last 5+ years remote with Singapore, United States, and Australian teams. Ran a real-time messaging service on Kubernetes. The service handles 100k+ messages per day. Tested the service to 100k concurrent connections.

Has a record of fixing production issues, such as memory exhaustion, slow pipelines, and manual deploys. Now prepares for the Certified Kubernetes Administrator examination. Works worldwide as a contractor through my registered company. Also accepts direct employment with relocation.

#section("Languages & Technologies")
<!-- ste-disable-next-line sentence-length -->
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
- Prepares for the Certified Kubernetes Administrator examination.
- Built #link("https://github.com/jyooi/elixir-opentui")[elixir-opentui], a terminal UI framework for Elixir with a Zig NIF backend. Work covers render, double buffer, and native interop.
- Built #link("https://github.com/jyooi/agent-simple-english")[agent-simple-english], a linter for Simplified Technical English.
- Built #link("https://github.com/jyooi/pi-ask-user-question")[pi-ask-user-question], a pi extension for structured user questions.

#role("uchat", "Nov 2024 – Apr 2026")
#subrole("Senior Software Engineer, Business unit", "Remote (Singapore)")
#context-line[Business inbox of uchat, a consumer messaging app in Thailand. More than 500 companies run their B2C conversations on it.]
- Tested the chat service to 100k concurrent connections before traffic growth. The test defined the capacity envelope before customer traffic reached it.
- Ran the real-time messaging service on Kubernetes. The service handles 100k+ customer messages per day for 500+ business accounts on a FastAPI backend.
- Built the frontend for the service with React, TypeScript, and Socket.IO. Reviewed team work on the frontend.

#role("Accomy", "Feb 2024 – Oct 2024")
#subrole("Senior Software Engineer", "Remote (Singapore)")
- Led 2 frontend engineers and shipped a corporate hotel booking MVP in 4 months. Started from an empty repository and released the product.

#role("Coinalpha (Hummingbot)", "Jun 2021 – Nov 2023")
#subrole("Software Engineer", "Remote (US)")
#context-line[Hummingbot is an open-source market-making framework for crypto trading bots.]
- Fixed memory leaks that exhausted 8 GB machines within hours. The fix cut steady-state memory by about 90 percent and removed freezes in long sessions.
- Reduced CI build times by half through pipeline changes.
- Built the React and FastAPI liquidity mining platform that about 1,000 bot operators use. They help with about \$100k in daily trading volume.

#role("Areca System", "2020 – 2021")
#subrole("Contract Software Engineer", "Penang, Malaysia")
- Designed an over-the-air update pipeline. The pipeline updates every in-store terminal across a 30-store chain automatically and removes manual on-site visits.
- Built the Electron point-of-sale system that the terminals run. The system covers cashier UI, transaction flows, and e-wallet payments.

#role("Aglive", "2017 – 2020")
#subrole("Software Engineer", "Remote (Australia)")
- Built and operated the tracking dashboard on the Austracker platform. The dashboard covers 500+ trucks and buses.
- Led deduplication of multi-million-row GPS data and removed about 25 percent duplicate records from customer reports.

#education("B.IT Communications and Networking (Hons), Universiti Tunku Abdul Rahman", "May 2017")
