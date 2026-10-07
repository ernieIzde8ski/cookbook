#import "/prelude.typ": *


/// Weights: mg of <substance> needed per liter of water
#let W = {
  let W = ()

  let Z = Zlomek
  let round = calc.round.with(digits: 0)

  let Substance(
    pure-name,
    impure-name,
    pure-mg-per-liter,
    purity-concentration,
    include-footnote: true,
  ) = {
    let purity_z = Z.new(purity-concentration)
    let pure-grams = Z.new(pure-mg-per-liter)

    let impure-grams = Z.div(pure-grams, purity_z)
    let impure-milligrams = Z.mult(impure-grams, 1000)

    let assumption = if include-footnote {
      let g-purity_f = purity_z.numerator / purity_z.denominator
      let assumption = if g-purity_f < 1.0 {
        let mg-purity_i = calc.round(g-purity_f * 1000)
        [#mg-purity_i;mg]
      } else [#calc.round(g-purity_f);g]
      fn[Assuming roughly #assumption of #pure-name per gram of commercial #impure-name.]
    }

    let r = [#impure-name#assumption]
    (r, impure-milligrams)
  }

  W.push(Substance(
    "sodium",
    "table salt",
    (430, 625),
    (590, 1500),
  ))

  W.push(Substance(
    "magnesium",
    "magnesium diglycinate",
    (30, 625),
    (117, 1000),
  ))

  W.push(Substance(
    "sugar",
    "sucralose",
    31,
    (600, 1),
    include-footnote: false,
  ))

  W
}

#let n-servings = 50
#let grams-per-serving = {
  let z = W.map(it => it.at(1)).reduce(Zlomek.add)
  (z.numerator / z.denominator) / 1000
}

#Recipe(
  title: "Transfeminine Gymder Fluid",
  description: [A potassium-free energy drink formulation. Inspired by Electrolit, Green
    Apple flavor.],
  yield: [#n-servings liters\
    (\~#calc.round(grams-per-serving, digits: 1) g. dry mix per L)],
  for (key, mg) in W {
    let g = mg.numerator / mg.denominator / 1000
    g *= n-servings
    let digits = if g < 1 { 2 } else if g < 10 { 1 } else { 0 }
    g = calc.round(g, digits: digits)
    [- #g;g #key]
  },
)[]
