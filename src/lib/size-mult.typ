#let abs(page, factor: 1 / 3) = calc.pow(
  page.height.pt() * page.width.pt(),
  factor,
)

#let LETTER = (height: 11in, width: 8.5in)

#let ratio(page, factor: 1 / 3) = abs(page, factor: factor) / abs(LETTER, factor: factor)
