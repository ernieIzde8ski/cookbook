#import "element.fn.typ": (
  blockquote, blockquote as bq, checklist, missing, semibold, semibold as sb, checklist,
  mdtable, invisible, HR, beside, aside, pause-spacer, pause,
)
#import "element/placeholder.typ": Placeholder
#import "element/recipe.typ": Recipe

#let CN = missing[citation]
#let VN = aside(missing(super: false)[volume])
/// -> content
#let V = {
  set align(center)
  v(1em)
  line(length: 50%)
  v(1em)
}
#let LS = v(0.5em)
#let hr = HR()

#let list-break = v(0.25em)
#let lsb = list-break
