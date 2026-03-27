#import "./palette.typ": Palette

#let DEFAULT_THEME = (
  link: Palette.spring-blue,
  link-label: Palette.wave-aqua-2,
  link-uri-insecure: Palette.ronin-yellow,
)

#let setdefault(dict, key, value) = {
  if key not in dict {
    dict.insert(key, value)
  }
  dict
}

#let resolve-theme(theme, overrides) = {
  let theme = (:..DEFAULT_THEME, ..theme, ..overrides)

  theme = setdefault(theme, "fg-border", theme.nontext)

  theme = setdefault(theme, "link-uri", theme.link)
  theme = setdefault(theme, "table-border", theme.fg-dim)
  theme = setdefault(theme, "raw-bg", theme.bg-dim)
  theme = setdefault(theme, "raw-fg", theme.regex)

  theme
}

#let _theme(..args) = resolve-theme(args.named(), (:))

#let Theme = (
  // https://github.com/rebelot/kanagawa.nvim/blob/aef7f5cec0a40dbe7f3304214850c472e2264b10/lua/kanagawa/themes.lua#L90
  wave: _theme( // The default theme
    /* UI */
    fg: Palette.fuji-white,
    fg-dim: Palette.old-white,
    fg-rev: Palette.wave-blue-1,

    bg-dim: Palette.sumi-ink-1,
    bg-gutter: Palette.sumi-ink-4,

    bg-m3: Palette.sumi-ink-0,
    bg-m2: Palette.sumi-ink-1,
    bg-m1: Palette.sumi-ink-2,
    bg: Palette.sumi-ink-3,
    bg-p1: Palette.sumi-ink-4,
    bg-p2: Palette.sumi-ink-5,

    special: Palette.spring-violet-1,
    nontext: Palette.sumi-ink-6,
    whitespace: Palette.sumi-ink-6,

    bg-search: Palette.wave-blue-2,
    bg-visual: Palette.wave-blue-1,

    /* SYN */
    regex: Palette.boat-yellow-2,

    /* DIAG */
    ok: Palette.spring-green,
    error: Palette.samurai-red,
    warning: Palette.ronin-yellow,
    info: Palette.dragon-blue,
    hint: Palette.wave-aqua-1,
  ),
  // https://github.com/rebelot/kanagawa.nvim/blob/aef7f5cec0a40dbe7f3304214850c472e2264b10/lua/kanagawa/themes.lua#L301
  lotus: _theme( // The light theme
    /* UI */
    fg: Palette.lotus-ink-1,
    fg-dim: Palette.lotus-ink-2,
    fg-rev: Palette.lotus-gray,

    bg-dim: Palette.sumi-ink-1,
    bg-gutter: Palette.sumi-ink-4,

    bg-m3: Palette.lotus-white-0,
    bg-m2: Palette.lotus-white-1,
    bg-m1: Palette.lotus-white-2,
    bg: Palette.lotus-white-3,
    bg-p1: Palette.lotus-white-4,
    bg-p2: Palette.lotus-white-5,

    nontext: Palette.lotus-violet-1,
    whitespace: Palette.lotus-violet-1,
    special: Palette.lotus-violet-2,

    bg-visual: Palette.lotus-violet-3,
    bg-search: Palette.lotus-blue-2,

    /* SYN */
    regex: Palette.lotus-yellow-2,

    /* DIAG */
    error: Palette.lotus-red-3,
    ok: Palette.lotus-green,
    warning: Palette.lotus-orange-2,
    info: Palette.lotus-teal-3,
    hint: Palette.lotus-aqua-2,
  ),
)
