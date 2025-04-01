local M = {}

M.base_30 = {
  white         = "#FFFFFF",
  darker_black  = "#1A1A1E",
  black         = "#222228", -- softer dark background
  black2        = "#292930",
  one_bg        = "#303038",
  one_bg2       = "#393942",
  one_bg3       = "#42424D",
  grey          = "#646473",
  grey_fg       = "#767685",
  grey_fg2      = "#90909F",
  light_grey    = "#A5A5B2",
  red           = "#e38480",
  baby_pink     = "#FFA3E0",
  pink          = "#FF8FDB",
  line          = "#31313A",
  green         = "#79D69F",
  vibrant_green = "#9AEFBF",
  nord_blue     = "#85B8FF",
  blue          = "#78AFFF",
  yellow        = "#ffd391",
  sun           = "#ffdcba",
  purple        = "#DC81FE", -- Your source color as primary accent
  dark_purple   = "#B463DB",
  teal          = "#5AD1CD",
  orange        = "#FFB084",
  cyan          = "#71D3FF",
  statusline_bg = "#282830",
  lightbg       = "#303038",
  pmenu_bg      = "#b499ff",
  folder_bg     = "#B98FF3",
}

M.base_16 = {
  base00 = "#222228", -- Background
  base01 = "#2A2A32",
  base02 = "#32323C",
  base03 = "#3B3B46",
  base04 = "#6D6D78",
  base05 = "#D6D6E0", -- Foreground (softened white)
  base06 = "#E2E2EA",
  base07 = "#F1F1F7",
  base08 = "#B63D6C", -- Error/red
  base09 = "#B46826", -- Warning/orange
  base0A = "#F4AD73", -- Alert/yellow
  base0B = "#84BF40", -- Success/green
  base0C = "#459393", -- Cyan
  base0D = "#176C6C", -- Blue
  base0E = "#aa86ff", -- Primary Purple (Accent)
  base0F = "#D3638F", -- Darker accent tone
}

M.type = "dark"

return M

