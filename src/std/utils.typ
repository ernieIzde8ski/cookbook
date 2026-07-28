/// Determines if an object appears to be an empty or zero-ish value.
///
/// - obj (any): object to check
/// -> bool: falsiness of the `obj`
#let is-falsy(obj) = (
  obj
    in (
      none,
      false,
      0,
      decimal("0"),
      0.0,
      float("NaN"),
      0%,
      "",
      (),
      (:),
      [],
      [ ],
    )
)

/// Determines if an object appears to be a non-empty & non-zero value.
///
/// - obj (any): object to check
/// -> bool: truthiness of the `obj`
#let is-truthy(obj) = not is-falsy(obj)
