#import "/prelude.typ": *

// #let round-step(num, step: 5) = calc.round(num / step) * step

#Recipe(title: "Baguettes", yield: "2-4 loaves", refs: <kabr_baguettes>)[
  // For some reason, King Arthur Baking uses Canadian cups, so this is a bit
  // smaller than you might expect.
  Pre-ferment:
  - 115mℓ water
  - EITHER: 200mg instant yeast #aside[350µℓ] \
    OR: 25g sourdough starter #aside[15mℓ]
  - 120g all-purpose flour #aside[230mℓ]

  Dough:
  - 255mℓ water
  - Pre-ferment (above)
  - 5g instant yeast #aside[7mℓ]
  - 420g all-purpose flour #aside[800mℓ]
  - 12g salt #aside[9mℓ]
  - 2g basil, dried #aside[10mℓ]
  // TODO: try rosemary
][
  + MIX pre-ferment ingredients roughly.
  + COVER at room temperature. #pause[12-16 hr.]
  + ADD ingredients to stand mixer in listed order.
  + MIX using dough hook 4 minutes on medium-low speed.#footnote[Speed 2 with a
      KitchenAid.]
  + COVER in greased bowl. #pause[45 min.]
  + DEFLATE dough.
  + REST covered. #pause[45 min.]
  + SLICE dough on greased surface into 2-4 equal portions.
  + FOR each portion:
    + FLATTEN slightly.
    + FOLD in half.
    + ROTATE 180°.
    + REPEAT previous steps.
    + ROLL into log.#footnote[For 2-3 baguettes, I recommend 40cm logs. For 4
        demi-baguettes, 20cm.]
    + ADD log seam-side down to greased baking tray or couche.
  + COVER logs until slightly puffy. #pause[45-60 min.] // TODO: Use King Arthur
  // Baking's term "marshmallowy", and add a glossary/glossary entry
  + PREHEAT oven to 230°C, with cast-iron pot on bottom rack. #pause[450°F; 15-30 min.]
  + BOIL 350mℓ of water. #aside[async.]
  + SCORE loaves.
  + ADD loaves to middle rack of oven, then boiling water to cast-iron pot.
  + BAKE until deeply golden-brown. #pause[24-28 min.]
  + IF making crispy baguettes:
    + HALT oven.
    + OPEN oven slightly ajar. #aside[\~5cm]
    + REST until baguettes are room temperature.
    ELSE:
    + COOL on wire rack.
]
