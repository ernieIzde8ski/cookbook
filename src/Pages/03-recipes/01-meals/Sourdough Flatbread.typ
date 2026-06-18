#import "/formatting.typ": *

#let fraction(value) = {
  if type(value) == decimal { return value }

  if "/" in value {
    let (numerator, denominator) = value.split("/")
    return decimal(numerator) / decimal(denominator)
  } else {
    return decimal(value)
  }
}

#let trim-decimal-suffix(dec) = {
  let decs = str(dec)
  if "." not in decs {
    return dec
  }
  decs = decs.replace(regex("\\.?0*$"), "")
  decimal(decs)
}

#assert(trim-decimal-suffix(decimal("0.10")) == decimal("0.1"))

#let smart-round(value) = {
  let THRESHOLDS = {
    let base = (1, "2.5", 5).map(decimal)
    let base = (
      base + base.map(x => x * 10) + base.map(x => x * 100) + (decimal(1000),)
    )
    let base = base.sorted()
    base
      .slice(1)
      .enumerate()
      .map(((i, threshold)) => (
        threshold,
        trim-decimal-suffix(base.at(i) / 10),
      ))
  }

  let multiple = none
  for (limit, step) in THRESHOLDS {
    if value < limit {
      multiple = step
      break
    }
  }
  if multiple == none {
    multiple = THRESHOLDS.last().at(0) / 10
  }

  trim-decimal-suffix(calc.round(value / multiple) * multiple)
}

#assert(smart-round(34) == 35)
#assert(smart-round(decimal("118.294041600")) == 120)


// TODO: extract to another module
/// @param {"metric" | "customary"} system - The measurement system to convert to.
/// @param {string} volume - The volume to normalize, alongside its unit, e.g. "2 cup", "3 mℓ", "1 tbsp", "4 tsp".
/// @return {string} The normalized volume, converted to the specified measurement system, e.g. "473 mℓ", "8 oz".
#let convert-volume(system, volume, round: true) = {
  let parse-volume(volume) = {
    let (amount, unit) = volume.trim().split(regex("\s+"))
    return (amount: fraction(amount), unit: unit)
  }

  // TODO: Generate this in Python and export to YAML or something.
  let (IN_METRIC, IN_TARGET) = {
    let M = (:)
    let C = (:)

    for (i, prefix) in ("µ", "m", "", "k", "M").enumerate() {
      let ratio = calc.pow(decimal("1000"), i - 2)
      for suffix in ("l", "L", "ℓ") {
        M.insert(prefix + suffix, ratio)
      }
    }
    // TODO: more strange non-SI metric units
    // M.c = M.ml * 250
    // M.cup = M.c

    C.drop = decimal("51.3429") * M.µℓ
    C.tsp = C.drop * 96
    C.tbsp = C.tsp * 3
    C.oz = C.tbsp * 2
    C.insert("fl oz", C.oz)
    C.insert("US fl oz", C.oz)
    C.c = C.at("fl oz") * 8
    C.cup = C.c
    C.pint = C.c * 2
    C.insert("US pt", C.pint)
    C.qt = C.pint * 2
    C.insert("US qt", C.qt)
    C.pot = C.qt * 2
    C.gal = C.pot * 2

    let A = (:)
    for (unit, in_liters) in (M.pairs(), C.pairs()).join() {
      A.insert(unit, in_liters)
    }

    if system == "metric" {
      (A, M)
    } else if system == "customary" {
      (A, C)
    } else {
      assert(false, message: "Unknown measurement system: " + system)
    }
  }

  let (amount, unit) = parse-volume(volume)
  assert(unit in IN_METRIC, message: "Unknown volume unit: " + unit)
  amount *= IN_METRIC.at(unit)

  let last-unit = none
  let last-quantity = none
  for (unit, ratio) in IN_TARGET.pairs().rev() {
    let quantity = amount / ratio
    if quantity >= 1200 {
      break
    }
    last-unit = unit
    last-quantity = quantity
    if quantity >= decimal("1.2") { break }
  }

  if round {
    last-quantity = smart-round(last-quantity)
  }

  str(last-quantity)
  " "
  last-unit
}

#let metric-volume = convert-volume.with("metric")

#assert(metric-volume("2 tbsp") == "30 mℓ")
#assert(metric-volume("3/2 tsp") == "7.5 mℓ")

#recipe(
  title: "Sourdough Flatbread",
  description: [Easy way to use up some starter.],
  yield: "8 flatbreads",
)[
  Dough:
  - 240g all-purpose flour #aside[450 mℓ]
  - 60g einkorn flour #aside[115 mℓ]
  - 120g levain #aside[125 mℓ]
  - 115 mℓ water, lukewarm
  - 55g Greek yogurt #aside[60 mℓ]
  // 300mℓ = 255g
  - 9g chicken bouillon #aside[11 mℓ]
  - 12g baking powder #aside[13 mℓ]

  Sauce:
  - 30g butter #aside[30 mℓ]
  - 7.5g garlic, minced #aside[4 cloves]
][
  + COMBINE ingredients roughly in large bowl.
  + COVER. #pause[15 min.]
  + PREHEAT oven to 260°C. #aside[500°F]
  + KNEAD completely smooth.
  + DIVIDE eightfold.
  + REST. #pause[5 min., optional]
  + FLATTEN into thin patties on baking sheet.
  + BAKE. #pause[5 min.]
  + FLIP patties and brush with sauce.
  + BAKE. #pause[3 min.]
  + COOL on wire racks.

  Best within 3 days. Do not refrigerate.
]
