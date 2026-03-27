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

#let as-bool(it) = {
  return it not in (
    0, decimal("0"), 0.0, float("NaN"), "", (), (:), [],
  )
}


#let content-to-str(key) = {
  if type(key) == str {
    key
  } else if type(key) == content {
    if key == smartquote(double: false) {
      return "'"
    } else if key == smartquote(double: true) {
      return "\""
    }
    key
      .fields()
      .values()
      .flatten()
      .map(content-to-str)
      .join("")
  } else {
    panic("unsupported type: " + repr(key))
  }
}
