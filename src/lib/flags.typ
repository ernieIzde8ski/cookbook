#let ISO_3166-1 = (:)
#let ISO_3166-2 = (:)

#for row in csv("/shared-data/flags.csv") {
  row = row.map(str.trim)
  let (code-2, code-3, value) = row
  if value == "" { continue }
  if code-2 != "" {
    assert(code-2.len() == 2)
    ISO_3166-2.insert(code-2, value)
  }
  if code-3 != "" { ISO_3166-1.insert(code-3, value) }
}

#let ISO_3166 = (:..ISO_3166-1, ..ISO_3166-2)
