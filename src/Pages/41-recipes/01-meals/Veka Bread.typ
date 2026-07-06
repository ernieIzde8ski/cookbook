#import "/prelude.typ": *
#import String: sentence-case
#import utils: is-truthy

#set par(justify: true)

#let image(body) = {
  set text(lang: "en")
  Placeholder(body, supplement: "image")
}

#let names = (
  "veka",
  "weka",
  "stangielka",
  "angielka",
  "linga",
  "bina",
  "kawiorka",
  "baton",
  "bułka wyborowa",
  "gryzka",
  "bułka kielecka",
  "bułka wrocławska",
  "bagietka wrocławska",
).sorted(key: it => (it.len(), it))

#let name-clause = {
  let last = names.pop()
  let names = (..names, "and " + last + ".")
  sentence-case(names.join(", "))
}

#Recipe(
  title: "Veka",
  // description: [
  //   Veka is a delicious, many-namèd bread#fn(name-clause), native to those temperate
  //   forests of Poland and Czechia. It is reminiscent of the @R_baguettes[baguette], except
  //   for that it has a higher rise and a soft shell.
  // ],
  yield: "na 2 veky",
)[
  #set text(lang: "cz")
  - 500g hladká mouka #aside[North America: all-purpose flour, 950mℓ]
  - 5g granulated sugar
  - 10g salt
  - 15g fresh yeast
  - 20g vegetable oil, 25ml water
][
  #set text(lang: "cz")
  Pour lukewarm water (roughly 30°C) into bowl and add other ingredients. Mix, move
  to [robotu], and mix on low speed for 10 minutes. Dump the well-mixed dough onto a
  lightly-floured surface. Divide into two parts and knead bochánky. Velmi lehce je
  poprášíme moukou, přikryjeme utěrkou nebo potravinářskou fólií, aby neoschly, a necháme
  30 až 45 minut zrát.

  #image[a long wide loaf resting on a wooden worksurface]

  Po vyzrání bochánky válečkem rozválíme do plných oválů.

  #image[thin flattened loaf]

  Ovál přetočíme delší stranou k sobě, těsto přeložíme, zamáčkneme a smotáme do válečku.

  #image[fingers beginning to roll thinned dough]
  #image[hands rolling dough to half under original width]

  Konce válečku zapíchneme prstem dovnitř. Rukama dotvoříme stejnoměrný váleček.

  #image[fingers jammed into corner of rolled log]

  Válečky položíme na plech a necháme 40 minut kynout.

  #image[two logs on smaller baking sheet]

  #v(0.5em)

  Troubu vyhřejeme na 230 °C. Na stěny trouby nastříkáme zavlažovačem vodu, dokud se
  nevytvoří oblak páry. Pak do ní ihned dáme plech s vekami a troubu zavřeme. Teplotu
  stáhneme na 200 °C a pečeme 16 až 18 minut dozlatova. Po celou dobu pečení neotvíráme
  troubu, už nepřipařujeme, zbylá pára z trouby nesmí ani odejít.

  #image[two beautiful golden rolls, now slightly bigger]
]
