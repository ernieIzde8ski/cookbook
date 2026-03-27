#let get-emoji(name) = {
  import "./flags.typ": ISO_3166

  let flag-match = name.match(regex("^flag_(.+)$"))
  if flag-match != none {
    let key = flag-match.captures.at(0)
    key = upper(key)
    if key in ISO_3166 { return ISO_3166.at(key) }
    key = lower(key)
    if key in ISO_3166 { return ISO_3166.at(key) }
  }
}

#let display-emoji(body) = {
  import "/utils.typ": content-to-str
  import "./kanagawa/mod.typ": THEME

  let pattern = regex(":([a-zA-Z_-]+):")

  show pattern: match => context {
    let capture = content-to-str(match)
      .match(pattern)
      .captures
      .at(0)

    let res = get-emoji(capture)
    let theme = THEME.get()
    if res == none { text(fill: theme.error, match) }
    else { res }
  }

  body
}