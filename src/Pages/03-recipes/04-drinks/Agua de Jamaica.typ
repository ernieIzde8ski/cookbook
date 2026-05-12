#import "/formatting.typ": *
#import "/shared-data.typ": *

#recipe(title: "Agua de Jamaica", description: [Agua de Jamaica is apparently just a tea.
  Who knew?
])[
  #let allspice = footnote[Allspice has the taste of cinnamon, cloves, and nutmeg---it
    doesn't add anything _new_ here.]
  #let piloncillo = footnote[Substitute 1:1 with brown sugar.]

  - 4L (1 gal.) fine-mesh grease keeper#Footnotes.grease-keeper
  - 1L water per iteration (see recipe)
  - 70g hibiscus petals #aside[1 cup]
  - 1 cinnamon stick
  - 1 pinch ground cloves
  - 1 pinch ground nutmeg
  - 1 pinch ground allspice (optional#allspice)
  - 90g piloncillo#piloncillo #aside[1/2 cup]
  - 200g white sugar #aside[1 cup]
][
  + ADD all ingredients except white sugar to pot.
  + BOIL.
  + REDUCE temperature & simmer. #pause[20-30 min.]
  + STRAIN into grease keeper. *Do NOT throw ingredients away yet.*
  + IF grease keeper is partially empty AND leaves are still potent:~
    + ADD 1L fresh water to pot.
    + GOTO step 2. #footnote[This repetition makes the jamaica incredibly strong; this is
        why we only use one cup of hibiscus petals while others use multiple.]
    ELSE:~
    + TOSS leaves.
  + STIR white sugar into grease keeper.
  + REFRIGERATE. #pause[minimum 8-12 hr.]
  + SERVE chilled.
]
