#import "/formatting.typ": *

= Broad Advice

It should be possible to prepare any recipe in this cookbook without needing to
read this section. If that is your intent, jump directly to @recipes. The
following advice will be useful instead for experimentation.


== Rice

// TODO: Cite Mexican Rice here.

Generally, you want to cook rice at a volumetric ratio of 2 water to 1 rice (or,
even better, slightly less). Recipes like @sticky-rice or Mexican Rice (TO-DO)
can get away with using less by precooking. In the latter case, undercooked rice
is even preferable.

== Bread Dough
=== Elasticity & Extensibility <elastic>

Firstly: Elasticity refers to a substance's ability to "spring back" to its
original shape. Extensibility refers to a substance's ability to stretch. You
typically want bread dough to have some degree of both. For instance, while
performing stretch & folds for sourdough bread, you want the bread to be able
to stretch without ripping apart (extensibility), but still be able to snap
back together (elasticity). Increasing elasticity often, if not always,
correlates with decreasing extensibility, and vice versa.

Several factors impact elasticity in bread:

- A lengthy @autolysis[autolysis phase] increases extensibility.
- Higher hydration increases extensibility. #footnote[I am not certain about the
    impact of non-water fluids.]
- Increased stretch & folds, and longer durations between stretch & folds,
  increases extensibility.
- Using @adv-flour[(wheat) flour] with higher gluten content, such as bread flour or gluten flour.

=== Flour <adv-flour>

In this cookbook, "generic flour" refers to bread flour, all-purpose flour, and
whole wheat flour. I use this as a baseline because you can substitute these
flours 1:1 with one another in most recipes, adjusting hydration to compensate.
Consult @fig-flour-faq: // TODO: Should this be in an appendix?

#figure(
  caption: [Quick reference for various flours.@wp-flour @kab-pizza-flour @tfl-flavor-flour @fnub_flour-101 @prbk_ch4[p. 57-60]],
  {
    let All-Purpose = {
      let names = ("All-Purpose", "Refined", "Plain", "Restaurant", "Hotel")
      let sampling = names.slice(0, 3).sorted().join("; ")
      let full = names.map(lower).sorted().join(" flour, ") + " flour"

      sampling
      footnote[I have thus far discovered the following names for this flour:
        #full, and simply "flour". I
        suspect there are more.]
    }

    let fn2 = footnote[~Almost (if not always) used as an additive.]

    let fn-cake = footnote[~I could not find a source for this, nor do I own
      any myself, but this seems like a reasonable conclusion, since white flour
      has a lower ash content than all other commonplace white flours@prbk_ch4[p.
        59] and because it is used in cake.]

    mdtable(align: center + horizon)[
      | *Category*  | *Variety*    | *Flavor*               | *Gluten*           |
      | :---:       | :---:        | :---:                  | :---:              |
      | White Flour | Cake Flour, Bleached | Negligible.#fn-cake | Low, 8%.      |
      | White Flour | #All-Purpose | Mildly nutty.          | Medium, 10-11.5%.  |
      | White Flour | Bread        | Mildly nutty.          | Mid-high, 12-14%.  |
      | White Flour | Gluten       | N/A#fn2                | Nearly pure, 100%. |
      | Whole-Wheat Flour      | < | Strong, earthy, nutty. | Mid-high, 12-13%.  |
      | Einkorn Flour          | < | Strong, rustic, sour.  | Uncertain.         |
    ]
  },
) <fig-flour-faq>

==== Common Wheat

In wheat cereals, gluten content (that is, protein content@wp-gluten) directly
correlates with density & elasticity. Thus, high-protein flours typically
require more hydration, and because of _that_, they're typically dense, chewy
flours. A thin pizza is probably best done with all-purpose flour; a
@pizza-sourdough[thick, chewy pizza] might instead use bread flour.

==== Other Wheats

Any recipe ordinarily calling for generic flour may also safely include up to
25% of "ancient grain" flours: einkorn (my favorite), spelt, buckwheat, barley,
emmer, amaranth, …#footnote[I am skeptical of the phrase "ancient grain",
  because it is clearly a marketing term, but it is nonetheless useful
  terminology to talk about other wheat-like varieties. "Unincorporated wheats"
  might prove more specific & more useful, but for now, I'll use the phrase
  people are more likely to be familiar with.]. These grains allow for much
more interesting flavors than pure bread flour or whole-wheat flour can allow
for. This is of course not a hard limit---my mother frequently makes a bread
that is maybe 50% ancient grain---but performing a substitution above 25% when
the recipe does not call for it may have unanticipated effects on the texture
of your dough.

Note also that most ancient grains, like all-purpose and whole-wheat flour,
require slightly more water than bread flour. Highly recommend learning a
recipe without any modifications if uncertain how a particular grain behaves.

As an incomplete thought: @r-potato-flour, made from boiled & dehydrated
potatoes, makes for very fluffy bread, and has a subtler taste than most
grains. I eventually plan to modify the @r-soft-sourdough-bread (initially
intended to be a recipe for soft sourdough bread) to incorporate potato flour,
though I have yet to discover the correct water ratio needed.

=== Autolysis <autolysis>

A typical sourdough bread recipe#footnote[Autolysis can be done with any bread,
  but I find it most frequently associated with "traditional" styles such as
  sourdough.] may open with these steps:

#bq[
  + Mix flour and water together in a large bowl.
  + Let bread sit for 1 hour.
  + Mix sourdough starter, salt, and seasonings into dough.
  + ...
]

The second step, in which the flour-water mixture rests for anywhere between 20
to 60 minutes, is the autolysis phase. While autolysis is an optional step, it
allows flour to "hydrate fully"; that is, "the water is completely absorbed by
the flour’s proteins and starches" @prbk-ch8[p. 159], and protease enzymes
break down proteins in the dough, making it easier to knead dough. Some bakers
also believe this improves the flavor of dough: minimal kneading prevents
@oxidation[oxidation].

Salt is not added because it interferes with proper hydrolization. There is
some dispute over whether yeast should be added before autolysis. Gisslen
advises against it: the acidity produced by yeast makes dough more
@elastic[elastic] @prbk-ch8[p. 159], which contradicts the purpose of
autolysis.

== Oxidation <oxidation>

Oxidation occurs when oxygen naturally present in the air reacts with particles
in a substance, such as in the sifting or mixing of flour. Oxidization is
sometimes somewhat desirable, especially in fermentation-based processes such
as kefir or maintaining a sourdough starter, but it typically should be kept to
a minimum as it can destroy flavors@prbk-ch5[p. 95]. This gives oxidation its
other name, "oxygen bleaching".
