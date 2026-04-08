#import "/formatting.typ": *
#import "/shared-data.typ": *

= Dulce de Leche <r-dulce-de-leche>

#intro[
  Preparing dulce de leche without condensed milk is a larger time
  investment, but on the plus side, it doesn't require buying condensed milk.
]

== Equipment

- Pot

== Ingredients

*Base:*
- 1 L. milk
- 300 g. sugar
- 1 pinch (1/4 tsp.) ground cinnamon
- 1/4 tsp. baking soda

*After cooking:*
- 1/2 tsp. vanilla extract

== Steps

+ Mix base ingredients in a pot over medium heat until pot begins to boil.
+ Reduce heat and simmer for 1.5 to 2 hours. Stir frequently, removing any
  emerging foam. Do NOT leave unattended#footnote[Milk fats just LOVE burning
    on you.].
+ When the sauce has browned & thickened, remove from heat and stir in vanilla.

== Trivia

I initially planned to make this recipe bain-marie style, as it seems to be
possible @bib-ka-dulce-de-leche, but I broke three mason jars in the
experiment, and my bain-marie proper isn't arriving for four days (on 12 apr.
2026). In the meantime this is happening.

// TODO: comment on these:
// - https://www.stirmate.com/product-page/stirmate-ii-smart-pot-stirrer
// - https://www.thermofisher.com/order/catalog/product/SP88857190


#let bib = box({
  set align(top)
  [== References]

  set text(size: 0.8em)
  set bibliography(title: none, full: true)

  ```hayagriva
  bib-kis:
    type: post
    title: Dulce de Leche
    author: Kevin Is Cooking
    date: 2024-04-11
    url:
      value: https://keviniscooking.com/dulce-de-leche/#wprm-recipe-container-96594
      date: 2026-04-08

  bib-md-dulce-de-leche:
    type: post
    title: How to make Dulce de Leche
    author: Ana Frias
    date: 2025-04-04
    url:
      value: https://www.muydelish.com/how-to-make-dulce-de-leche/
      date: 2026-04-08

  bib-ka-dulce-de-leche:
    type: post
    title: How to make dulce de leche at home
    author: Tatiana Bautista
    date: 2024-07-04
    url:
      value: https://www.kingarthurbaking.com/blog/2024/07/04/how-to-make-dulce-de-leche-at-home
      date: 2026-04-08
  ```
})
#align(bottom, bib)
