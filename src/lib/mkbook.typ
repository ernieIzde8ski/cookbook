#let DEFAULT_RECIPE_PATH = "/Pages/03-recipes/"

#let mkcover() = include "../Pages/00-cover.typ"

#let mkoutline() = include "/Pages/01-outline.typ"

#let mkadvice() = {
  set par(first-line-indent: (amount: 1em, all: true))
  include "../Pages/02-advice.typ"
}

#let mkrecipechapter(title, offset: 1) = {
  import "/formatting.typ": title-case

  set align(center + horizon)
  set text(size: 1.5em)
  set heading(offset: offset)
  title
}

#let mkrecipe(path, base-path: DEFAULT_RECIPE_PATH) = {
  import "/formatting.typ": format-recipe

  let path = base-path + path
  format-recipe(include path)
}

#let mkrecipes(recipes) = {
  import "/formatting.typ": title-case

  mkrecipechapter([= Recipes <recipes>], offset: 0)

  pagebreak()

  // don't worry about it
  let Chapter = regex("(?:^|/)(?:\\d+-)([a-zA-Z]+)/$")
  for recipe in recipes {
    let chapter = recipe.match(Chapter)
    if chapter != none {
      let title = title-case(chapter.captures.at(0))
      mkrecipechapter([= #title])
    } else {
      mkrecipe(recipe)
    }
    pagebreak()
  }
}

// TODO: Add section headers
#let mkpgheader(gap: 0.5em) = none

#let mkpgfooter(gap: 0.5em) = context {
  let page-no = counter(page).display("1 of 1", both: true)

  if page.width < 30em.to-absolute() {
    return align(right, page-no)
  }

  import "/lib/format.typ": format-date
  import "/utils.typ": as-bool

  let sep = {
    h(gap)
    [---]
    h(gap)
  }

  let today = format-date(datetime.today())
  let title = if document.title != none {
    let title = text(document.title, style: "italic")
    if document.author.len() == 0 or document.author.len() > 2 {
      title
    } else [
      #title, by #document.author.join(" & ")
    ]
  } else if document.author.len() < 3 {
    document.author.join(" & ")
  }

  set align(center)
  set text(size: 14pt)
  (title, page-no, [Accessed #today]).filter(as-bool).join(sep)
}

#let mkreferences() = bibliography("/Pages/04-references.yaml")

#let mkbook(
  authors: (),
  title: none,

  page-size: "us-letter",

  page-header: true,
  page-footer: true,
  cover: true,
  advice: true,
  outline: true,
  recipes: (),
  references: true,
) = {
  import "/formatting.typ": stylize-elements

  set document(author: authors, title: title)
  set page(
    header: mkpgheader(),
    footer: mkpgfooter(),
  )

  show: stylize-elements(page-size: page-size)

  let pages = (
    if cover { mkcover() },
    if outline { mkoutline() },
    if advice { mkadvice() },
    if recipes.len() > 0 { mkrecipes(recipes) },
    if references { mkreferences() },
  )

  pages.filter(it => it != none).join(pagebreak(weak: true))
}
