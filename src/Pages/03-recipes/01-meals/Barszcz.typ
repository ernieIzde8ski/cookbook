#import "/formatting.typ": *

#let fns = (
  meat: fn[I'd recommend frying beef after having let it soak in a beef marinade for 12-24 hours. Sausage & ham work fine too, though you need plenty of ham for ham to work.],
)

= Barszcz

Red beet soup. Polish spelling. Alternate names include: Борщ
(:flag_ukr:/:flag_rus:), Borsch(t) (direct transliteration), Боршч
(:flag_blr:), Borshch (direct transliteration), ...

== Ingredients

#context {
  let columns = 2
  if page.columns == 2 {
    columns -= 1
  }
  let data = (
    broth: [
      *Broth:*
      - Beets
      - Cabbage
      - Carrots
      - One large onion
      - Salt & seasonings to taste, or #url[chicken bouillon]
      - Splash of vinegar
      - Water
    ],
    extra: [
      *Extra:*
      - Meat#fns.meat, cooked
      - Fried potatoes, medium chunks
    ],
    toppings: [
      *Toppings*:
      - Cream
      - Dill
    ],
  )
  if page.columns == 1 {
    table(
      columns: 2,
      table.cell(rowspan: 2, data.broth),
      data.extra,
      data.toppings,
    )
  } else {
    data.broth
    data.extra
    data.toppings
  }
}

Add as much or as little of each ingredient as you'd like. All ingredients aside from beets, salt, and water are optional.

== Steps

+ Dice beets into large chunks and carrots & onion into small chunks.

+ Mix broth ingredients in a large pot. Season as desired.

+ Boil broth until beets are cooked throughout. While this is happening, you may want to cook your meat & potatoes.

+ After water cools down somewhat, toss meat & potatoes into broth.

+ Serve fresh. Top with dill & cream.
