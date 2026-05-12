#import "/formatting.typ": *
#import "/shared-data.typ": *

#recipe(
  title: "Agua de Jamaica",
  description: [Agua de Jamaica is apparently just a tisane. Who knew?],
  yield: [4ℓ],
)[
  #let allspice = footnote[Allspice has the taste of cinnamon, cloves, and nutmeg---it
    doesn't add anything _new_ here.]
  #let piloncillo = footnote[Substitute 1:1 with brown sugar.]

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
  + ADD all ingredients except white sugar to pot.
  + BOIL.
  + REDUCE temperature & simmer. #pause[10-15 min.]
  + STRAIN into grease keeper. *Do NOT throw ingredients away yet.*
  + IF grease keeper is partially empty AND leaves are still potent:~
    + ADD *only* 1ℓ fresh water to pot.
    + GOTO step 2. #footnote[This repetition makes the jamaica incredibly strong; this is
        why we only use one cup of hibiscus petals while others use multiple.]
    ELSE:~
    + TOSS leaves.
  + STIR white sugar into grease keeper.
  + REFRIGERATE. #pause[minimum 4 hr.]
  + SERVE chilled.
]
