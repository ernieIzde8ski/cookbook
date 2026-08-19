#import calc: *

#let round-to-multiple(num, step) = (type(step))(round(num / step) * step)

#{
  import "tests.typ": *

  assert-eq(round-to-multiple(183.2, 5), 185)
  assert-eq(type(round-to-multiple(183.2, 5)), int)
  assert-eq(type(round-to-multiple(183.2, 5.0)), float)
}
