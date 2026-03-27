#import "@preview/oxifmt:1.0.0": strfmt as format

#let fmt = format

#let display(obj) = context {
  import "./kanagawa/mod.typ": THEME
  import "./format.typ": format

  if type(obj) == regex {
    let string = repr(obj)
      .replace(
        regex("regex\(\"(.+)\"\)"),
        (obj) =>  obj.captures.at(0).replace("\\\\", "\\"),
      )

    set text(fill: THEME.get().raw-bg)
    raw(format("/{}/", string), lang: "regex")
  }
  else [#obj]
}

#let format-date(date) = fmt(
  "{year:<04}-{month:<02}-{day:<02}",
  year: date.year(), month: date.month(), day: date.day()
)