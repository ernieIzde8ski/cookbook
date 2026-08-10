/// Returns a placeholder wrapped inside a figure.
///
/// - body (content): the content to display (or `none`)
/// - supplement (str): the type for the placeholder, eg `image` or `content`
/// -> content
#let Placeholder(body, supplement: none) = {
  import "../utils.typ": is-truthy
  // used https://rgbcolorpicker.com, pretty good
  let LIGHT = color.rgb("#f8f8ab")
  let DARK = LIGHT.darken(40%)

  let slm = if supplement == none [placeholder] else [#supplement placeholder]

  show: figure.with(supplement: slm)
  show: box.with(fill: DARK, inset: 0.25em, radius: 12%, width: 50%)
  show: box.with(fill: LIGHT, inset: 0.5em, radius: 6%, width: 100%)

  set text(style: "italic")
  if is-truthy(body) [#slm: #body] else { slm }
}
