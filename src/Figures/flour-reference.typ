#import "/formatting.typ": *
#import "./flour-reference.lib.typ": Flour

#let NorthAmerica = (flags.CAN, flags.USA, flags.MEX).join[ ]
#let WhiteFlourTaste = [Mildly nutty.]
#let flours = (
  Flour(
    "All-Purpose Flour",
    "Refined Flour",
    "Plain Flour",
    "Restaurant Flour",
    "Hotel Flour",
    origin: NorthAmerica,
    flavor: WhiteFlourTaste,
    ash: (39, 44),
    gluten: (10%, 11.5%),
    roughness: "Fine",
  ),

  Flour(
    "Cake Flour",
    origin: NorthAmerica,
    flavor: [Negligible.#fn[I could not find a source for this, nor do I own any myself,
        but this seems like a reasonable conclusion, because cake flour has a lower ash
        content than all other commonplace white flours and because it is used in cake.]
    ],
    ash: 0.3%,
    gluten: 8%,
    roughness: [Smooth/fine],
  ),

  Flour(
    "Bread Flour",
    "Patent Bread Flour",
    origin: NorthAmerica,
    flavor: WhiteFlourTaste,
    ash: (0.35%, 0.55%),
    gluten: (11%, 13.5%),
    roughness: [Slightly coarse],
  ),

  Flour(
    "High-Gluten Flour",
    origin: NorthAmerica,
    ash: 0.5%,
    gluten: 14%,
  ),

  Flour(
    "Vital Wheat Gluten",
    "Seitan",
    flavor: [N/A#fn[Always used as an additive.]],
    gluten: (
      70,
      80,
      [70-80%#fn[Professional Baking actually specifies "0.39-4.4%" (39-440%%), which I
          take to be an incredibly powerful typo.]],
    ),
    origin: NorthAmerica,
  ),

  Flour(
    "Whole-Wheat Flour",
    gluten: (12, 13),
    origin: NorthAmerica,
    roughness: [Coarse],
  ),

  // ROMANIAN SCIENTISTS, THANK YOU VERY MUCH
  // this is the ONLY data I have hard data on (as of 2026-07-05)
  // ROMANIA

  // We're using the CI95%± values for ash content
  Flour(
    "Wheat Flour 480",
    origin: flags.ROU,
    ash: (0.46%, 0.55%),
    gluten: (12.42, 13.97),
  ),

  Flour(
    "Wheat Flour 550",
    ash: (0.55%, 0.60%),
    gluten: (11.59, 14.20),
    origin: flags.ROU,
  ),

  Flour(
    "Wheat Flour 650",
    ash: (0.59%, 0.67%),
    gluten: (10.15, 13.59),
    origin: flags.ROU,
  ),

  Flour(
    "Făină neagră",
    "Type 1250",
    origin: flags.ROU,
    meaning: [Black whole-wheat flour, lit. "black flour"],
    ash: (1.14%, 1.60%),
    roughness: [Fine],
  ),

  // More from Professional Baking
  Flour(
    "Bread Flour",
    flavor: WhiteFlourTaste,
    gluten: (11%, 11.5%),
    origin: flags.EU,
    roughness: [Slightly coarse],
  ),

  Flour(
    "Pastry Flour",
    ash: (40, 45),
    flavor: WhiteFlourTaste,
    gluten: 9%,
    origin: NorthAmerica,
    roughness: [Smooth/fine],
  ),

  Flour(
    "Durum Flour",
    gluten: (12%, 16%),
    origin: NorthAmerica,
  ),

  // Thank u babiččina

  Flour(
    "Pšeničná krupice",
    origin: flags.CZE,
    meaning: [Semolina, lit. "wheat semolina"],
    ash: 48,
    gluten: 11%,
    roughness: [Coarse],
  ),

  Flour(
    "Krupička",
    origin: flags.CZE,
    meaning: ["Fine semolina"],
    ash: (48, 50),
    gluten: 11%,
    roughness: [Fine],
  ),

  Flour(
    "Pšeničná mouka hrubá",
    origin: flags.CZE,
    meaning: ["Coarse wheat flour"],
    ash: (43, 45),
    gluten: 11%,
    roughness: [Coarse],
    flavor: WhiteFlourTaste,
  ),

  Flour(
    "Pšeničná mouka polohrubá",
    origin: flags.CZE,
    meaning: [\"Premium semi-coarse wheat flour"],
    ash: (40, 45),
    gluten: 11,
    roughness: [Semi-coarse],
  ),

  Flour(
    "Pšeničkná mouka hladká",
    origin: flags.CZE,
    meaning: ["Fine wheat flour"],
    ash: (52, 53),
    gluten: 12%,
    roughness: [Fine],
    flavor: WhiteFlourTaste,
  ),
)

#{
  let flours = flours.sorted(key: it => (it.gluten.sort-field, it.name))

  let headers = (
    "From",
    "Name(s)",
    "Meaning",
    "Ash",
    "Protein",
    "Coarseness",
    "Flavor",
  )
  let columns = headers.len()

  let cells = for flour in flours {
    let names = align(left, (flour.name, ..flour.aliases.sorted()).join[\ ])
    let meaning = if flour.meaning != none { align(left, flour.meaning) }

    // cell 1
    (flour.origin,)

    // cells 2-3
    if meaning == none {
      (table.cell(names, colspan: 2),)
    } else {
      (names, meaning)
    }

    // cells 4-7
    (flour.ash, flour.gluten.display, flour.roughness, flour.flavor)
  }

  show: figure.with(
    caption: [Reference for various flours & associated powders, ordered by protein
      content.@wp-flour @kab-pizza-flour @tfl-flavor-flour @fnub_flour-101 @prbk_ch4[pp.
        57-60] @ar_vital-wheat-gluten @brm_vital-wheat-gluten @pf_confusion-flour.9
      @bvb_mouk @romanian-flours],
  )

  table(
    fill: simple-cell-fill,
    stroke: none,
    columns: columns,
    table.hline(y: 0),
    table.hline(y: 1, stroke: .5pt),
    table.header(..headers),
    ..cells,
    table.hline(),
  )
} <fig_flour-faq>
