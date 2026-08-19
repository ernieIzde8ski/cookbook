#let assert-eq(left, right) = {
  import "@preview/oxifmt:1.0.0": strfmt as format

  assert(left == right, message: format("assertion failed: {:?} == {:?}", left, right))
}
