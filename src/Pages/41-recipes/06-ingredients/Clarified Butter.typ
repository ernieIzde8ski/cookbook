#import "/prelude.typ": *

// Lasts "3 months pantry, 1 year fridge":
// https://www.recipetineats.com/how-to-make-ghee-and-clarified-butter/
//
// Measurements:
// - 112g butter ~> 90g/100mℓ clarified butter + unspecified milk solids
// - 113.6g/118mℓ butter -> 93.6g clarified butter + 8.57g/15mℓ milkfat
#Recipe(title: "Clarified Butter", yield: [95g clarified butter #aside[105mℓ]\ 9g milk
  solids #aside([15mℓ])])[
  - Bain-marie
  - #beside[(optional)] Cheesecloth
  - 110g butter #aside[1/2 cup]
][
  + STEAM butter in bain-marie over simmering water, until molten.
  + SKIM foam#fn[The white foam produced by melting is milk protein, also called milk
      solids. Tasty.] off.
  + STRAIN through cheesecloth into storage.
]
