#import "/formatting.typ": *

#let round-step(num, step: 5) = calc.round(num / step) * step


#let prefmt-yeast-tsps = Zlomek.new(("1.15", 16))

// per https://www.kingarthurbaking.com/learn/ingredient-weight-chart
#let prefmt-yeast-weight = {
  let weight-ratio = Zlomek.prod(
    prefmt-yeast-tsps,
    (1, 3), //  -> tablespoons
    9, //       -> grams
    1000, //    -> milligrams
  )
  let mgs = round-step(weight-ratio.numerator / weight-ratio.denominator, step: 50)
  [#mgs mg]
}

// King Arthur Baking uses the oldschool Canadian volumes, for some reason.
#let prefmt-yeast-volume = {
  let amt = Zlomek.prod(
    prefmt-yeast-tsps,
    (47355, 10000), //  -> mℓs
    1000, //            -> µℓs
  )
  let µℓs = round-step(amt.numerator / amt.denominator, step: 50)
  [#µℓs µℓ]
}

#let prefmt-flour-volume = {
  let amt = Zlomek.prod(
    "236.5882",
    (1, 2),
  )
  let mℓs = round-step(amt.numerator / amt.denominator, step: 5)
  [#mℓs mℓ]
}

#recipe(title: "Big Baguettes", yield: "2 wide loaves")[
  Pre-ferment:
  - 115 mℓ water
  - #prefmt-yeast-weight instant yeast #aside(prefmt-yeast-volume)
  - 120g all-purpose flour #aside(prefmt-flour-volume)
][
  + MIX pre-ferment ingredients roughly.
  + REST at room temperature. #pause[14-16 hr.]
]
