
#let title-case(string) = (
  string.split().map(it => upper(it.at(0)) + lower(it.slice(1))).join(" ")
)
