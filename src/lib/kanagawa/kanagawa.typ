#import "./palette.typ": Palette
#import "./theme.typ": Theme, resolve-theme
#import "../uri.typ"

#let display-link(theme) = (obj) => {
  let color = theme.link
  let _underline = false

  if type(obj.dest) == label {
    color = theme.link-label
  } else if type(obj.dest) == str {
    if obj.dest.starts-with("http://") {
      color = theme.link-uri-insecure
    } else {
      color = theme.link-uri
      _underline = true
    }
  }

  set text(fill: color)
  if _underline { underline(obj) }
  else { obj }
}

#let THEME = state("kanagawa-theme", Theme.wave)

#let kanagawa( ..overrides, base-theme: Theme.wave) = (body) => {
  let theme = resolve-theme(base-theme, overrides.named())

  THEME.update(_old => theme)

  set page(fill: theme.bg)
  set text(fill: theme.fg)

  set line(stroke: theme.fg-border)
  set table(stroke: theme.table-border)
  show link: display-link(theme)
  show footnote: set text(fill: theme.link-label)

  body
}
