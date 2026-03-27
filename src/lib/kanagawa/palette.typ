// Derived from:
// https://github.com/rebelot/kanagawa.nvim/blob/aef7f5cec0a40dbe7f3304214850c472e2264b10/lua/kanagawa/colors.lua

#let Palette = (
    // Bg Shades
    sumiInk0: 0x16161D,
    sumiInk1: 0x181820,
    sumiInk2: 0x1a1a22,
    sumiInk3: 0x1F1F28,
    sumiInk4: 0x2A2A37,
    sumiInk5: 0x363646,
    sumiInk6: 0x54546D, //fg

    // Popup and Floats
    waveBlue1: 0x223249,
    waveBlue2: 0x2D4F67,

    // Diff and Git
    winterGreen: 0x2B3328,
    winterYellow: 0x49443C,
    winterRed: 0x43242B,
    winterBlue: 0x252535,
    autumnGreen: 0x76946A,
    autumnRed: 0xC34043,
    autumnYellow: 0xDCA561,

    // Diag
    samuraiRed: 0xE82424,
    roninYellow: 0xFF9E3B,
    waveAqua1: 0x6A9589,
    dragonBlue: 0x658594,

    // Fg and Comments
    oldWhite: 0xC8C093,
    fujiWhite: 0xDCD7BA,
    fujiGray: 0x727169,

    oniViolet: 0x957FB8,
    oniViolet2: 0xb8b4d0,
    crystalBlue: 0x7E9CD8,
    springViolet1: 0x938AA9,
    springViolet2: 0x9CABCA,
    springBlue: 0x7FB4CA,
    lightBlue: 0xA3D4D5, // unused yet
    waveAqua2: 0x7AA89F, // improve lightness: desaturated greenish Aqua

    // waveAqua2 : 0x68AD99,
    // waveAqua4 : 0x7AA880,
    // waveAqua5 : 0x6CAF95,
    // waveAqua3 : 0x68AD99,

    springGreen: 0x98BB6C,
    boatYellow1: 0x938056,
    boatYellow2: 0xC0A36E,
    carpYellow: 0xE6C384,

    sakuraPink: 0xD27E99,
    waveRed: 0xE46876,
    peachRed: 0xFF5D62,
    surimiOrange: 0xFFA066,
    katanaGray: 0x717C7C,

    dragonBlack0: 0x0d0c0c,
    dragonBlack1: 0x12120f,
    dragonBlack2: 0x1D1C19,
    dragonBlack3: 0x181616,
    dragonBlack4: 0x282727,
    dragonBlack5: 0x393836,
    dragonBlack6: 0x625e5a,

    dragonWhite: 0xc5c9c5,
    dragonGreen: 0x87a987,
    dragonGreen2: 0x8a9a7b,
    dragonPink: 0xa292a3,
    dragonOrange: 0xb6927b,
    dragonOrange2: 0xb98d7b,
    dragonGray: 0xa6a69c,
    dragonGray2: 0x9e9b93,
    dragonGray3: 0x7a8382,
    dragonBlue2: 0x8ba4b0,
    dragonViolet: 0x8992a7,
    dragonRed: 0xc4746e,
    dragonAqua: 0x8ea4a2,
    dragonAsh: 0x737c73,
    dragonTeal: 0x949fb5,
    dragonYellow: 0xc4b28a,//"#a99c8b",
    // "#8a9aa3,

    lotusInk1: 0x545464,
    lotusInk2: 0x43436c,
    lotusGray: 0xdcd7ba,
    lotusGray2: 0x716e61,
    lotusGray3: 0x8a8980,
    lotusWhite0: 0xd5cea3,
    lotusWhite1: 0xdcd5ac,
    lotusWhite2: 0xe5ddb0,
    lotusWhite3: 0xf2ecbc,
    lotusWhite4: 0xe7dba0,
    lotusWhite5: 0xe4d794,
    lotusViolet1: 0xa09cac,
    lotusViolet2: 0x766b90,
    lotusViolet3: 0xc9cbd1,
    lotusViolet4: 0x624c83,
    lotusBlue1: 0xc7d7e0,
    lotusBlue2: 0xb5cbd2,
    lotusBlue3: 0x9fb5c9,
    lotusBlue4: 0x4d699b,
    lotusBlue5: 0x5d57a3,
    lotusGreen: 0x6f894e,
    lotusGreen2: 0x6e915f,
    lotusGreen3: 0xb7d0ae,
    lotusPink: 0xb35b79,
    lotusOrange: 0xcc6d00,
    lotusOrange2: 0xe98a00,
    lotusYellow: 0x77713f,
    lotusYellow2: 0x836f4a,
    lotusYellow3: 0xde9800,
    lotusYellow4: 0xf9d791,
    lotusRed: 0xc84053,
    lotusRed2: 0xd7474b,
    lotusRed3: 0xe82424,
    lotusRed4: 0xd9a594,
    lotusAqua: 0x597b75,
    lotusAqua2: 0x5e857a,
    lotusTeal1: 0x4e8ca2,
    lotusTeal2: 0x6693bf,
    lotusTeal3: 0x5a7785,
    lotusCyan: 0xd7e3d8,
)


#for (key, value) in Palette {
  import "@preview/oxifmt:1.0.0": strfmt as format

  if type(value) == int {
    value = format("{:<06X}", value)
  }

  if type(value) == str {
    assert(value.len() == 6, message: format("Value in key-value pair ({}, {}) should have length 6", key, value))
    value = rgb(value)
  }

  // undo camelCase
  key = key.replace(regex("[A-Z]|\d+"), match => "-" + lower(match.text))
  Palette.insert(key, value)
}
