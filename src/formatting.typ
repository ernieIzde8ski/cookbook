#import "/lib/emoji.typ": display-emoji
#import "/lib/format.typ": display
#import "/lib/format.typ": format-date
#import "/lib/size-mult.typ"

#import "utils.typ": as-bool
#import "shared-data.typ": *

#import "@preview/oxifmt:1.0.0": strfmt as fmt

#let baby-blue = rgb("EAF2F5")

#let mdtable = {
  import "@preview/tablem:0.3.0": three-line-table
  three-line-table.with(fill: (_, y) => if calc.odd(y) { baby-blue })
}

#let invisible(body) = hide(place(body, float: false))

#let HR(length: 50%) = {
  set align(center)
  show: pad.with(y: 0.5em)
  line(length: 50%)
}

#let hr = HR()

#let list-break = v(0.25em)
#let lsb = list-break

#let title-case(string) = (
  string.split().map(it => upper(it.at(0)) + lower(it.slice(1))).join(" ")
)

#let dimensions-from-diagonal-length(
  diagonal-length,
  height,
  width,
) = {
  let c-squared = calc.pow(height, 2) + calc.pow(width, 2)
  let c = calc.sqrt(c-squared)
  let distance-per-pixel = diagonal-length / c
  (height: height * distance-per-pixel, width: width * distance-per-pixel)
}
#let dimensions-from-ppi(ppi, height, width) = (
  height: height / ppi * 1in,
  width: width / ppi * 1in,
)

#let PAGE_DIMENSIONS = (
  "Kobo Clara BW": dimensions-from-diagonal-length(6in, 1448, 1072),
  "iPhone 16e": dimensions-from-ppi(460, 2532, 1170),
)

#let stylize-elements(
  page-size: "us-letter",
  uri-default: blue,
  uri-label: green.darken(20%),
  uri-insecure: red,
  bg: white,
  bg-dim: luma(80%),
) = body => context {
  import "/lib/size-mult.typ"
  import "/lib/stylize.typ": *

  let page-args
  if type(page-size) == str {
    page-args = PAGE_DIMENSIONS.at(page-size, default: (page-size,))
  } else {
    page-args = page-size
  }
  set page(..page-args)

  show: body => context {
    // 41.7 with my phone, 78.6 with `us-letter`
    let size = calc.pow(page.width.pt() * page.height.pt(), 1 / 3)
    let multiplier = size-mult.ratio(page)

    set text(
      font: ("Twitter Color Emoji", "Libertinus Serif"),
      size: 12pt * size / 78.6,
    )

    body
  }

  show raw.where(block: false): it => {
    show: box.with(
      fill: bg-dim,
      radius: 25%,
      outset: (bottom: 3pt, top: 2pt),
      inset: (x: 2pt),
    )
    set text(fill: theme.raw-fg)
    it
  }

  show raw.where(lang: "hayagriva"): it => bibliography(bytes(it.text))

  set pagebreak(weak: true)

  show: display-emoji

  let OUTLINE_DEPTH = state("PREV_OUTLINE_DEPTH", none)
  show outline.entry: it => context {
    // In Typst v0.14, these default to 0.55em and 1em
    let above = block.above
    let below = block.below

    if it.level == 1 {
      above = 140em / 100
    } else if it.level == 2 {
      above = 80em / 100
    }

    set block(above: above, below: below)
    it
  }

  set par(
    first-line-indent: 0em,
    spacing: 0.85em,
    leading: 0.45em,
  )
  set text(region: "US")

  show heading.where(depth: 1): set text(size: 1.5em)
  show heading: it => {
    let text-size = 1em
    if it.depth < 2 {
      it = underline(it)
      text-size = 1.50em
    } else if it.depth == 2 {
      text-size = 1.25em
    } else if it.depth == 3 {
      text-size = 1.15em
    } else {
      it = {
        set text(style: "italic")
        it
      }
    }
    set text(size: text-size)
    it
  }

  show ref: it => {
    let elem = it.element

    if it.form == "page" {
      return context {
        let page-no = locate(it.citation.key).page()
        [pg. #page-no]
      }
    }

    if elem == none or elem.numbering != none {
      return it
    }

    let body = it.supplement
    if it.supplement == auto {
      body = elem.body
    }
    // `type(elem) == content`, not `heading`
    show: link.with(it.citation.key)
    underline(body)
    [ (#ref(it.citation.key, form: "page"))]
  }
  show link: it => {
    let color = uri-default
    let _underline = false

    if type(it.dest) == label {
      color = uri-label
    } else if type(it.dest) == str {
      if it.dest.starts-with("http://") {
        color = uri-insecure
      } else {
        _underline = true
      }
    }

    set text(fill: color)
    if _underline { underline(it) } else { it }
  }
  set footnote(numbering: "(1)")
  show footnote.entry: set text(0.85em)

  show regex("^-\|$"): list-break

  show quote.where(block: true): set block(above: auto, below: auto)
  show quote.where(block: true): box.with(
    inset: (left: 0.5em),
    stroke: (left: 2pt + gray),
  )

  set bibliography(title: "References", style: "american-chemical-society")

  body
}

#let resolve-length(len, parent-length) = {
  len.length + len.ratio / 100% * parent-length
}

#let format-recipe(body) = {
  show heading.where(depth: 1): it => {
    [#counter(footnote).update(0)]
    align(center, it)
  }
  set heading(offset: 2)

  show footnote.entry: set text(0.85em)

  show "1/8": "⅛"
  show "1/4": "¼"
  show "1/3": "⅓"
  show "3/8": "⅜"
  show "1/2": "½"
  show "5/8": "⅝"
  show "3/4": "¾"
  show "5/6": "⅚"
  show "7/8": "⅞"

  body
}

#let V = {
  set align(center)
  v(1em)
  line(length: 50%)
  v(1em)
}

#let blockquote = quote.with(block: true)
#let bq = blockquote
