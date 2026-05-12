#import "/formatting.typ": *
#import "/shared-data.typ": *

#let fn-potency = fn[Expect \~3-4 iterations: hibiscus petals are highly potent and can be
  boiled more than once.]

#recipe(
  title: "Agua de Jamaica",
  description: [Jamaica is apparently just a tisane. Who knew?],
  panel-width: 12em,
  yield: [4ℓ],
)[
  - 4ℓ fine-mesh grease keeper#sharedfn[grease-keeper] #pause[\~1 gal.]
  - \~6ℓ water #aside[\~1.5 gal., see recipe]
  - 200g white sugar #aside[1 cup]

  #text(weight: "semibold")[Spices@ar_jamaica:]
  - 120g piloncillo#sharedfn[piloncillo] #aside[1/2 cup@ac_piloncillo]
  - 70g hibiscus petals, dried#fn[Use a bit less if you don't like sour jamaica.]
    #aside[1 cup]
  - 10g cinnamon #aside[2-3 long sticks]
  - 1 pinch ground cloves
  - 1 pinch ground nutmeg
  - 1 pinch ground allspice (optional#sharedfn[allspice])
][
  + WHILE grease keeper has room AND petals remain potent#fn-potency:
    + SIMMER spices over *1ℓ* fresh water, covered. #pause[10-15 min.]
    + STRAIN into grease keeper. #pause-spacer
  + STIR white sugar into grease keeper and fill remainder with water.
  + COOL uncovered until comfortable to hold. #pause[\~30 min.; 50°C/125°F]
  + REFRIGERATE covered. #pause[≥ 4 hr.]
  + SERVE chilled, within 3 mo.
]
