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
    product: none,
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
      fn({
        [Assuming roughly #assumption of #pure-name per gram of #impure-name.]
        if product != none [\ Referenced product: #product]
      })
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
    "lemon-flavored magnesium diglycinate",
    (30, 625),
    (250, 4500),
    product: [https://www.walgreens.com/store/c/walgreens-magnesium-glycinate-powder-lemon/ID=300455406-product],
  ))

  W.push(Substance(
    "sugar",
    "sucralose",
    (31000, 650),
    (600, 1),
    include-footnote: false,
  ))

  W.push(Substance(
    "calcium",
    "calcium citrate",
    (50, 650),
    (500 * 18, 25950),
    product: [#link(
        "https://www.walgreens.com/store/c/walgreens-calcium-citrate-500-mg-tablets-(100-days)/ID=300437334-product",
      )[Walgreens Calcium Citrate 500 mg Tablets], crushed into powder with their #link(
        "https://www.walgreens.com/store/c/walgreens-pill-crusher/ID=prod6328102-product?criteria=Recently+Viewed+Items&position=3&wic=932130",
      )[pill crusher]. Each pill weighs about 1.44 grams.],
  ))

  W
}

#let smartround(t) = calc.round(t, digits: if t < 1 { 2 } else if t < 10 { 1 } else { 0 })
#let n-servings = 263
#let grams-per-serving = {
  let z = W.map(it => it.at(1)).reduce(Zlomek.add)
  (z.numerator / z.denominator) / 1000
}

#Recipe(
  title: "Transfeminine Gymder Fluid",
  description: [A potassium-free energy drink formulation. Inspired by Electrolit, Green
    Apple flavor.],
  yield: [#n-servings liters\
    (\~#smartround(grams-per-serving)g dry mix per L)],
  for (key, mg) in W {
    let g = mg.numerator / mg.denominator / 1000
    g *= n-servings
    let digits = if g < 1 { 2 } else if g < 10 { 1 } else { 0 }
    g = calc.round(g, digits: digits)
    [- #g;g #key]
  },
)[
  + MIX powder, crushing if necessary.
  + ADD #smartround(grams-per-serving)g of powder to 1L of water.
]

== Trivia
Transgender women often take the anti-androgen spironolactone, which, alongside other
traits, acts as a potassium-preserving diuretic. Essentially, electrolytes go into body,
potassium stays in, everything else gets flushed out. For gymgoers, an energy drink that
does not feature potassium can thus prove very helpful.

#let safetyLimit = 15
#let sucraloseGrams = 47.7
#let weightEstimate = 60
Because we use sucralose in place of sugar, there are safety limits. At time of writing,
we call for #sucraloseGrams milligrams of sucralose per liter of fluid, and the EFSA & the
FDA advise that individuals consume no more than #safetyLimit milligrams of sucralose per
kilogram of body weight per day. That is to say, if you weigh #weightEstimate kilograms,
you should consume no more than $(weightEstimate times safetyLimit)/sucraloseGrams
= #{ calc.round(weightEstimate * safetyLimit / sucraloseGrams, digits: 1) }#[~] frac("L", "day", style: "skewed")$
of this stuff a day on average.

Neither this recipe nor any claims made herein have been reviewed by the FDA or any other
health organizations; you prepare this product at your own risk.
