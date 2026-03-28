#import "utils.typ"
#import "utils.typ": content-to-str
#import "/lib/uri.typ"


#let normalize-key(key) = {
  if type(key) != str {
    return none
  }
  lower(
    key.trim().replace(regex("(\s|-)+"), "-").replace(regex("[^a-zA-Z-]"), ""),
  )
}

#let URL = (
  chicken-bouillon: "https://www.amazon.com/Knorr-Chicken-Flavor-Bouillon-35-3/dp/B0711K2YP7",
  grease-keeper: "https://www.amazon.com/Oggi-7347-Jumbo-Grease-Stainless/dp/B0711FN8BG",
  pullman-loaf-pan: "https://shop.kingarthurbaking.com/items/pullman-loaf-pan",
  baking-steel: "https://alexandracooks.com/2020/05/01/simple-sourdough-pizza-a-step-by-step-guide/",
  sodium-citrate: "https://www.amazon.com/dp/B07NF4B3Y7",
  cream: "https://en.wikipedia.org/wiki/Cream",
)


#let url(display, key: auto) = {
  if key == auto {
    key = display
  }
  key = content-to-str(key)
  if uri.is-uri(key) {
    return link(key, display)
  }
  key = normalize-key(key)
  let url = URL.at(key, default: none)
  if url == none {
    text(display, fill: red)
  } else {
    link(url, display)
  }
}

#let Footnotes = utils.map-values(
  (
    bean-expansion: [Dry beans expand to 2-3 times their size.],
    bean-seasoning: [#url[Chicken bouillon] works even better! Toss in your favorite seasonings. Sometimes I like assorted Italian seasoning, onion powder, garlic powder, or cloves of garlic.],
    bean-soaking: [While you don't _have_ to soak your beans, it may help your beans cook more consistently.],
    bean-stinking: [Beans will get stinky after more than a day or two of soaking.],
    cream: [Americans: #url[Cream], not #url[sour cream]!],
    cumin: [Be VERY careful with cumin. A pinch too much of salt? Salty, but you'll survive. A pinch too much of cumin? Completely inedible.],
    food-processor: [You can technically get away with a blender, but it's a hell of a lot more tedious.],
    grease-keeper: [In the absence of a #url(key: "grease keeper")[fine-mesh grease keeper], a cheesecloth or a metal fine-mesh strainer, and a generic 4-liter container, will do fine.],
    rice-cooker: [My rice cooker cooks up to 12 cups.],
    sodium-citrate: [Sodium citrate is a cheese emulsifier; that is, it helps keep cheese molecules bound to water molecules. It's also somewhat saline, so you get to use less salt when you use it.],
    the-texture-destroyer: [Just don't boil it. I trust you.],
  ),
  mappers: (
    it => [~#it],
    footnote,
  ),
)

#let Fn = Footnotes

#let fn(body) = {
  let key = content-to-str(body)
  let key = normalize-key(content-to-str(body))
  if key != none and key in Footnotes {
    return Footnotes.at(key)
  }
  return footnote[~#body]
}
