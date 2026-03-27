#let fold-recipes(recipes) = {
  let folder(recipes, ..parents) = {
    let parents = parents.pos()
    if type(recipes) == dictionary {
      for (key, value) in recipes {
        (..parents, key)
        folder(value, ..parents, key)
      }
    } else if type(recipes) == array {
      recipes.map(it => (..parents, it)).sorted()
    } else {
      panic("bad type: " + repr(recipes))
    }
  }

  if type(recipes) == str {
    // TODO: only allow type `path` when it comes in a future typst release
    // Waiting until Typst 0.15 for this to happen; see https://github.com/typst/typst/pull/7555
    // Until then, we detect path by its ending.
    if recipes.ends-with("/") {
      recipes += "index.yaml"
    }
    recipes = yaml(recipes)
  }

  folder(recipes)
}
