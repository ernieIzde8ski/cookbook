#import "/formatting.typ": *

#recipe(
  title: "Nacho Cheese",
  description: "This cheese is real easy and it don't taste of flour, thanks to a little sodium citrate.",
)[
  #let fn = (
    cheese: footnote[~Shredded cheese will dissolve easier, but a block works just fine
      too.],
  )

  - 200g cheddar cheese#fn.cheese
  - 200g milk
  - 10g #url[sodium citrate] #Fn.sodium-citrate
  - 1/4 tsp. chili powder // TODO: metric
  - Red food dye (optional)
][
  + MIX ingredients in small pot, medium-low, until fully combined. Do not overheat.
  + POUR into new container.
]
