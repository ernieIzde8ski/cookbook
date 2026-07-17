#let map-keys(data, map: ()) = {
  if type(map) == function {
    let result = (:)
    for (key, value) in data {
      result.insert(map(key), value)
    }
    return result
  }

  for func in map {
    data = map-keys(data, map: map)
  }
  data
}

#let map-values(data, mapper: none, mappers: ()) = {
  if type(mapper) == array {
    return map-values(data, mappers: mapper)
  }

  if mapper != none {
    let res = (:)
    for (key, value) in data {
      res.insert(key, mapper(value))
    }
    return res
  }

  for mapper in mappers {
    data = map-values(data, mapper: mapper)
  }
  data
}

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

#let as-bool = is-truthy

#let content-to-str(key) = {
  if type(key) == str {
    key
  } else if type(key) == content {
    if key == smartquote(double: false) {
      return "'"
    } else if key == smartquote(double: true) {
      return "\""
    }
    key.fields().values().flatten().map(content-to-str).join("")
  } else if type(key) == label {
    return repr(key)
  } else {
    panic("unsupported type: " + repr(key))
  }
}
