-- /utils/palettes/cat-oksolarized.lua

-- --| OKsolarized |---------------------------------------------------------------------------------------------------
-- stylua: ignore

local cat_oksolarized = {}

local defaults = {
  palette_mode = "dark",
}

cat_oksolarized.options = nil

function cat_oksolarized.setup(options)

  cat_oksolarized.options = vim.tbl_deep_extend("force", {}, defaults, options or {})
  cat_oksolarized.options.palette_mode = "dark"

  if vim.o.background == "light" then
    cat_oksolarized.options.palette_mode = cat_oksolarized.light
    print("utils.cat-neosolarized: palette_mode = light")
  else
    cat_oksolarized.options.palette_mode = cat_oksolarized.dark
    print("utils.cat-neosolarized: palette_mode = dark")
  end

  return cat_oksolarized.options.palette_mode
end

cat_oksolarized.main = {
  yellow  = "#AC8300",
  orange  = "#D56500",
  red     = "#F23749",
  magenta = "#DD459D",
  violet  = "#7D80D1",
  blue    = "#2B90D8",
  cyan    = "#259D94",
  green   = "#819500",

  base03 = "#002D38",
  base02 = "#093946",
  base01 = "#5B7279",
  base00 = "#657377",

  base0 = "#98A8A8",
  base1 = "#8FAAAB",
  base2 = "#F1E9D2",
  base3 = "#FBF7EF",

  bg_red = "#da0000",
}

local palette = cat_oksolarized.main

cat_oksolarized.dark = {
  bg0 = palette.base03,
  bg1 = palette.base02,
  bg2 = palette.base03,

  fg0 = palette.base0,
  fg1 = palette.base00,
  fg2 = palette.base01,

  blue    = palette.blue,
  cyan    = palette.cyan,
  green   = palette.green,
  magenta = palette.magenta,
  orange  = palette.orange,
  red     = palette.red,
  violet  = palette.violet,
  yellow  = palette.yellow,
}

cat_oksolarized.light =  {
  bg0 = palette.base3,
  bg1 = palette.base2,
  bg2 = palette.base3,

  fg0 = palette.base01,
  fg1 = palette.base0,
  fg2 = palette.base00,

  blue    = palette.blue,
  cyan    = palette.cyan,
  green   = palette.green,
  magenta = palette.magenta,
  orange  = palette.orange,
  red     = palette.red,
  violet  = palette.violet,
  yellow  = palette.yellow,
}

