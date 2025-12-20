-- /utils/cat-neosolarized.lua
-- disabled if below line is active
-- if true then return {} end

-- --| cat_solarized |-------------------------------------------------------------------------------------------------

--- create palette tables for cat_solarized color theme
---@class cat_solarized
local cat_solarized = {}

-- src: https://github.com/Tsuzat/NeoSolarized.nvim/blob/master/lua/NeoSolarized/config.lua
--- default settings: dark palette
---@class defaults
local defaults = {
  palette_mode = "dark",
}

--- initialize options or something
cat_solarized.options = nil

-- --| cat_solarized: setup |------------------------------------------------------------------------------------------

--- create dark and light mode palette tables swapping for cat_solarized
---@param options string|table
---@return string|table
function cat_solarized.setup(options)

  cat_solarized.options = vim.tbl_deep_extend("force", {}, defaults, options or {})
  cat_solarized.options.palette_mode = "dark"

  if vim.o.background == "light" then
    cat_solarized.options.palette_mode = cat_solarized.light
    print("utils.cat-neosolarized: palette_mode = light")
  else
    cat_solarized.options.palette_mode = cat_solarized.dark
    print("utils.cat-neosolarized: palette_mode = dark")
  end
  return cat_solarized.options.palette_mode
end
-- stylua: ignore start

-- --| cat_solarized: main |-------------------------------------------------------------------------------------------

--- cat_solarized: base palette colors to be used by dark and light palette_mode
cat_solarized.main = {

  bg0 = "#002B36",
  bg1 = "#073642",
  bg2 = "#002B36",

  fg0 = "#586E75",
  fg1 = "#657B83",
  fg2 = "#586E75",

  blue    = "#268BC2",
  cyan    = "#2aa198",
  green   = "#859900",
  magenta = "#d33682",
  orange  = "#cb4b16",
  red     = "#dc322f",
  violet  = "#6c71c4",
  yellow  = "#b58900",

  base00 = "#657B83",
  base01 = "#586E75",
  base02 = "#073642",
  base03 = "#002B36",

  base0 = "#839496",
  base1 = "#93a1a1",
  base2 = "#eee8d5",
  base3 = "#fdf6e3",

  bg_red = "#da0000",
}
local palette = cat_solarized.main

-- --| cat_solarized: dark |-------------------------------------------------------------------------------------------

--- cat_solarized: dark palette_mode colors
cat_solarized.dark = {

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

-- --| cat_solarized: light |------------------------------------------------------------------------------------------

--- cat_solarized: light palette_mode colors
cat_solarized.light = {

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
-- stylua: ignore end

return cat_solarized
