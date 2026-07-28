#import "/std/palette.typ" as palette: *
#import "/std/shared-data.typ": *
#import "/std/element.typ" as element: *

#import "/std/Dimensions.typ"
#import "/std/Emoji.typ"
#import "/std/String.typ"
#import "/std/String.typ": title-case
#import "/std/Zlomek.typ"
#import "/std/format.typ": display
#import "/std/format.typ": fmt
#import "/std/format.typ": format
#import "/std/format.typ": format-date
#import "/std/size-mult.typ"
#import "/std/utils.typ": as-bool
#import "/std/utils.typ": is-truthy


/// - len (relative): length
/// - parent-length (length): absolute parent to relative length
/// -> length
#let resolve-length(len, parent-length) = {
  len.length + len.ratio / 100% * parent-length
}
