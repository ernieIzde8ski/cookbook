#context {
  import "/formatting.typ": invisible

  set page(header: none, footer: none)
  set align(center + horizon)
  set text(size: 2em)

  invisible[= Cover Page]

  if document.title != none {
    set text(size: 2em, weight: "bold")
    document.title
    parbreak()
  }

  let auths = document.author
  auths = if auths.len() == 0 { none }
  else if auths.len() == 2 { auths.join(" & ") }
  else { auths.join("; ") }
  if auths != none [
    by #auths
  ]

  pagebreak(weak: true)
}
