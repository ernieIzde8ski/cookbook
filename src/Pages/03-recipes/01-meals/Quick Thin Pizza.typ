#import "/formatting.typ": *

#show: recipe.with(
  title: "Quick Thin Pizza",
  description: [
    Quickly-prepared pizza with a thin crust. Adapted from a recipe by PJ
    Hamel:~https://www.kingarthurbaking.com/recipes/super-fast-thin-crust-pizza-dough-recipe
  ],
  panel-width: 40%,
)[
  Dough:
  - 150mℓ water, warm
  - 5g instant yeast #aside[8mℓ]
  - 40g olive oil #aside[45mℓ]
  - 240g all-purpose flour #footnote[~While you _can_ use bread flour, it will not work
      well, because this recipe is very thin.] #aside[450mℓ]
  - 3g salt #aside[2mℓ]
  - 4g baking powder #aside[5mℓ]


  Recommended toppings:
  - Tomato sauce
  - Shredded mozzarella
  - Turkey pepperoni

  *Yields 1 pizza.*
]

#let sep = v(0.35em)
+ MIX dough in order: water & yeast; oil; remaining ingredients.
+ COVER dough and rest. #pause[20 min.]
+ PREHEAT oven to 225°C. #aside[450°F] #pause[10 min.]
+ FLATTEN into crust on baking tray. Should be 1/2 to 1 cm. tall.
+ BAKE until cooked throughout. #pause[10-12 min.]
+ REMOVE from oven and add toppings.
+ BAKE until cheese browns. #pause[6-8 min.]
+ REST before cutting. #pause[3 min.]
