#import "/lib/mkbook.typ": mkbook

#let mkbook = mkbook.with(
  /* --- Overridable Properties <<< */
  // page-size: "us-letter",
  theme: "lotus",
  /* >>> Overridable Properties ---*/


  /* --- Metadata <<< */
  authors: "Ernie Izdebski",
  title: "Cookbook 2",
  recipes: yaml("/Pages/03-recipes/index.yaml"),
  /* */
)
