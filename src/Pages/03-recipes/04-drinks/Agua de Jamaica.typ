#import "/formatting.typ": *
#import "/shared-data.typ": *

#recipe(
  title: "Agua de Jamaica",
  description: [Agua de Jamaica is apparently just a tisane. Who knew?],
  panel-width: 12em,
  yield: [4ℓ],
)[
  #let allspice = fn[Allspice has the taste of cinnamon, cloves, and nutmeg; it doesn't
    add anything _new_ here.]
  #let piloncillo = fn[Substitute 1:1 with brown sugar.]

  - 4ℓ fine-mesh grease keeper#Footnotes.grease-keeper #aside[\~1 gal.]
  - \~6ℓ water #aside[\~1.5 gal., see recipe]
  - 200g white sugar #aside[1 cup]

  Spices:
  - 70g hibiscus petals, dried#fn[Use a bit less if you don't like your jamaica sour.]
    #aside[1 cup]
  - 10g cinnamon #aside[2-3 long sticks]
  - 1 pinch ground cloves
  - 1 pinch ground nutmeg
  - 1 pinch ground allspice (optional#allspice)
  - 120g piloncillo#piloncillo #aside[1/2 cup]
][
  + WHILE grease keeper has room AND boiled water is not translucent#fn[This repetition
      makes the jamaica incredibly strong; this is why we only use one cup of hibiscus
      petals while others use multiple.]:
    + SIMMER spices over *1ℓ* fresh water, covered. #pause[10-15 min.]
    + STRAIN into grease keeper. #pause-spacer
  + STIR white sugar into grease keeper and fill remainder with water.
  + COOL uncovered until comfortable to hold. #pause[\~30 min.; 50°C/125°F]
  + REFRIGERATE covered. #pause[≥ 4 hr.]
  + SERVE chilled, within 3 mo.
]
