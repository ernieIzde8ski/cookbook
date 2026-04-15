#import "/formatting.typ": *

#let PERMYRIAD = "‱"
#let is-numeric(it) = type(it) in (float, int, decimal)
#let ratio-to-permyriad(ratio) = decimal(repr(ratio).trim("%")) * 100
#let round = calc.round.with(digits: 1)

/// Validates data pertaining to a type of flour.
///
/// - name (str): Primary name for the flour.
/// - aliases (arguments): Alternate names for the flour. Any positional arguments are ignored.
/// - meaning (content): Meaning of the primary name (or any aliases).
/// - origin (content): Place or country of origin.
/// - flavor ():
/// - ash ():
/// - gluten ():
/// - roughness ():
/// -> dictionary
#let Flour(
  primary-name,
  ..aliases,
  meaning: none,
  origin: none,
  flavor: "Unknown.",
  ash: "Unknown.",
  gluten: "Unknown.",
  roughness: [Slightly coarse #super[[?]]],
) = {
  /********* FIELD VALIDATION *********/

  let aliases = aliases.pos()

  // FIELD VALIDATION: `flavor`

  if flavor == auto {
    flavor = [Unknown.]
  }

  // FIELD VALIDATION: `ash`

  /// -> ratio
  let ash = ash
  if type(ash) == ratio {
    // convert to a permyriad
    ash = ratio-to-permyriad(ash)
  }
  if is-numeric(ash) {
    ash = round(ash, digits: 1)
    ash = [#ash#PERMYRIAD]
  }
  if type(ash) == array and ash.len() == 2 {
    ash = (
      ash
        .map(it => if type(it) == ratio { ratio-to-permyriad(it) } else { it })
        .map(round.with(digits: 1))
        .map(str)
        .join([-])
        + PERMYRIAD
    )
  }

  /*** FIELD VALIDATION: `gluten` ***/

  /// -> dictionary
  let gluten = if gluten == none {
    (:)
  } else if type(gluten) == array {
    (lower: gluten.at(0), upper: gluten.at(1), display: gluten.at(2, default: auto))
  } else if is-numeric(gluten) or type(gluten) == ratio {
    (lower: gluten, upper: gluten)
  } else {
    (display: gluten)
  }

  if gluten.at("lower", default: auto) == auto {
    gluten.lower = gluten.at("upper", default: auto)
  }
  if gluten.at("upper", default: auto) == auto {
    gluten.upper = gluten.at("lower", default: auto)
  }

  if is-numeric(gluten.lower) {
    gluten.lower = round(gluten.lower, digits: 1) * 1%
  }
  if is-numeric(gluten.upper) {
    gluten.upper = round(gluten.upper, digits: 1) * 1.0%
  }

  let is-valid-protein-quantity(q) = (
    type(q) == ratio or q in (auto, none)
  )

  assert(
    is-valid-protein-quantity(gluten.lower) and is-valid-protein-quantity(gluten.upper),
    message: fmt(
      "input should be type `auto | ratio | (ratio, ratio) | dictionary`\n"
        + "received value (type: {}): {:?}",
      type(gluten.upper),
      gluten.upper,
    ),
  )

  if gluten.at("display", default: auto) == auto {
    let (lower, upper) = (gluten.lower, gluten.upper) // @typstyle off
    gluten.display = {
        if lower == auto { "Unknown" }
        else if lower == none { "None" }
        else if lower == upper { repr(lower) }
        else { repr(lower) + "-" + repr(upper) }
      }
  }

  gluten.sort-field = if type(gluten.upper) == ratio {
    (gluten.upper + gluten.lower) / 2%
  } else {
    float.inf
  }

  /*** END FIELD HANDLING ***/

  (
    name: primary-name,
    aliases: aliases,
    flavor: flavor,
    meaning: meaning,
    origin: origin,
    ash: ash,
    gluten: gluten,
    roughness: roughness,
  )
}
