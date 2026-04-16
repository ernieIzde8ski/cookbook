#let style-link(theme) = obj => {
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
  if _underline { underline(obj) } else { obj }
}
