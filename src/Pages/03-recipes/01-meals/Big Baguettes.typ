#import "/formatting.typ": *

#let prefmt-yeast-tsps = decimal("1") / 16

#let prefmt-yeast-weight = {
  let tbsps = prefmt-yeast-tsps / 3
  let grams = tbsps * 9
  let mgs = grams * 1000
  let round-to-mg = 50
  let rounded-mg = calc.round(mgs / round-to-mg) * round-to-mg
  [#rounded-mg mg]
}

#let prefmt-yeast-volume = {
  let mℓs = prefmt-yeast-tsps * 5
  let µℓs = mℓs * 1000
  let round-to-µℓ = 50
  let rounded-µℓ = calc.round(µℓs / round-to-µℓ) * round-to-µℓ
  [#rounded-µℓ µℓ]
}

#recipe(title: "Big Baguettes", yield: "2 wide loaves")[
  Pre-ferment:
  - 115 mℓ water
  - #prefmt-yeast-weight instant yeast #aside(prefmt-yeast-volume)
][
  + MIX pre-ferment ingredients roughly.
  + REST at room temperature. #pause[14-16 hr.]
]
