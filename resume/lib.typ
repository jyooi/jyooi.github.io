// Shared layout for every resume variant.
// Follows the ByteByteGo "Tech Resume Inside Out" guidance: single column,
// top-to-bottom, dates hard right, skills above experience, education last.

#let accent = rgb("#2c4a6e")
#let todo-color = rgb("#c2410c")

// Unfilled facts render loudly so a variant is never sent out half-written.
// Note: Typst swallows a ";" placed directly after the closing bracket of a
// content argument, so end a #todo[] with a period or reword - never ";".
#let todo(body) = text(fill: todo-color, weight: "bold")[[#body]]

#let section(title) = {
  v(0.45em)
  text(fill: accent, weight: "bold", size: 9pt, tracking: 0.08em, upper(title))
  v(-0.70em)
  line(length: 100%, stroke: 1pt + accent)
  v(-0.28em)
}

#let role(company, dates) = {
  v(0.28em)
  grid(
    columns: (1fr, auto),
    text(weight: "bold", size: 10.2pt, company),
    text(fill: luma(70), dates),
  )
}

#let subrole(title, location) = {
  v(-0.48em)
  grid(
    columns: (1fr, auto),
    text(style: "italic", size: 9.2pt, title),
    text(style: "italic", size: 9.2pt, fill: luma(70), location),
  )
  v(-0.24em)
}

// One-line company context, for employers a reviewer will not recognise.
#let context-line(body) = {
  v(-0.04em)
  text(size: 9.0pt, style: "italic", fill: luma(60), body)
}

#let header(tagline) = {
  align(center)[
    #text(size: 18pt, weight: "bold")[Jia Yi Ooi]

    #v(-0.42em)
    #text(size: 10pt, fill: luma(60))[#tagline]

    #v(-0.28em)
    #text(size: 8.6pt)[
      Penang, Malaysia (UTC+8) · Remote worldwide or relocation · #link("mailto:me@jyooi.com")[me\@jyooi.com]
    ]

    #v(-0.45em)
    #text(size: 8.6pt)[
      #link("https://jyooi.com")[jyooi.com] ·
      #link("https://www.linkedin.com/in/jia-yi-ooi-564a90111/")[LinkedIn] ·
      #link("https://github.com/jyooi")[GitHub]
    ]
  ]
}

// Compact single-line education, for candidates whose degree is long behind them.
// Wrapped with its own heading in an unbreakable block so the heading can never
// strand at the foot of a page with the degree orphaned onto the next one.
#let education(degree, date) = {
  block(breakable: false)[
    #section("Education")
    #v(0.1em)
    #grid(
      columns: (1fr, auto),
      text(weight: "bold", size: 9.8pt, degree),
      text(fill: luma(70), date),
    )
  ]
}

#let resume(body) = {
  set page(paper: "a4", margin: (x: 1.4cm, y: 0.85cm))
  set text(font: "Libertinus Serif", size: 9.3pt)
  set par(leading: 0.40em)
  show link: set text(fill: accent)
  set list(indent: 0.6em, body-indent: 0.45em, spacing: 0.34em)
  body
}
