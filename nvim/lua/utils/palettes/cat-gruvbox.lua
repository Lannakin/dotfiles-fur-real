-- /utils/palettes/cat-gruvbox.lua

-- src: https://github.com/ellisonleao/gruvbox.nvim/blob/main/lua/gruvbox.lua
-- license: MIT License
-- https://github.com/ellisonleao/gruvbox.nvim/blob/main/LICENSE

-- --| gruvbox |-------------------------------------------------------------------------------------------------------
local cat_gruvbox = {}

-- src: https://github.com/Tsuzat/NeoSolarized.nvim/blob/master/lua/NeoSolarized/config.lua
local defaults = {
  palette_mode = "dark",
}

cat_gruvbox.options = nil

function cat_gruvbox.setup(options)

  cat_gruvbox.options = vim.tbl_deep_extend("force", {}, defaults, options or {})
  cat_gruvbox.options.palette_mode = "dark"

  if vim.o.background == "light" then
    cat_gruvbox.options.palette_mode = cat_gruvbox.light
    print("utils.cat-neosolarized: palette_mode = light")
  else
    cat_gruvbox.options.palette_mode = cat_gruvbox.dark
    print("utils.cat-neosolarized: palette_mode = dark")
  end

  return cat_gruvbox.options.palette_mode
end

-- --| gruvbox: main |-----------------------------------------------------------------------------------------------
--stylua: ignore
cat_gruvbox.main = {
  dark0      = "#282828",
  dark0_hard = "#1d2021",
  dark0_soft = "#32302f",
  dark1      = "#3c3836",
  dark2      = "#504945",
  dark3      = "#665c54",
  dark4      = "#7c6f64",

  gray = "#928374",

  light0      = "#fbf1c7",
  light0_hard = "#f9f5d7",
  light0_soft = "#f2e5bc",
  light1      = "#ebdbb2",
  light2      = "#d5c4a1",
  light3      = "#bdae93",
  light4      = "#a89984",

  bright_aqua   = "#8ec07c",
  bright_blue   = "#83a598",
  bright_green  = "#b8bb26",
  bright_orange = "#fe8019",
  bright_purple = "#d3869b",
  bright_red    = "#fb4934",
  bright_yellow = "#fabd2f",

  neutral_aqua   = "#689d6a",
  neutral_blue   = "#458588",
  neutral_green  = "#98971a",
  neutral_orange = "#d65d0e",
  neutral_purple = "#b16286",
  neutral_red    = "#cc241d",
  neutral_yellow = "#d79921",

  faded_aqua   = "#427b58",
  faded_blue   = "#076678",
  faded_green  = "#79740e",
  faded_orange = "#af3a03",
  faded_purple = "#8f3f71",
  faded_red    = "#9d0006",
  faded_yellow = "#b57614",

  dark_aqua      = "#49503b",
  dark_aqua_hard = "#3e4934",
  dark_aqua_soft = "#525742",

  light_aqua      = "#e8e5b5",
  light_aqua_hard = "#e6e9c1",
  light_aqua_soft = "#e1dbac",

  dark_green      = "#62693e",
  dark_green_hard = "#5a633a",
  dark_green_soft = "#686d43",

  light_green      = "#d5d39b",
  light_green_hard = "#d3d6a5",
  light_green_soft = "#cecb94",

  dark_red      = "#722529",
  dark_red_hard = "#792329",
  dark_red_soft = "#7b2c2f",

  light_red      = "#fc9487",
  light_red_hard = "#fc9690",
  light_red_soft = "#f78b7f",
}

local palette = cat_gruvbox.main
-- --| gruvbox: dark |-----------------------------------------------------------------------------------------------
-- stylua: ignore
cat_gruvbox.dark = {
  bg0 = palette.dark0,
  bg1 = palette.dark1,
  bg2 = palette.dark2,
  bg3 = palette.dark3,
  bg4 = palette.dark4,

  fg0 = palette.light0,
  fg1 = palette.light1,
  fg2 = palette.light2,
  fg3 = palette.light3,
  fg4 = palette.light4,

  aqua   = palette.bright_aqua,
  blue   = palette.bright_blue,
  gray   = palette.gray,
  green  = palette.bright_green,
  orange = palette.bright_orange,
  purple = palette.bright_purple,
  red    = palette.bright_red,
  yellow = palette.bright_yellow,

  neutral_aqua   = palette.neutral_aqua,
  neutral_blue   = palette.neutral_blue,
  neutral_green  = palette.neutral_green,
  neutral_purple = palette.neutral_purple,
  neutral_red    = palette.neutral_red,
  neutral_yellow = palette.neutral_yellow,

  dark_aqua  = palette.dark_aqua,
  dark_green = palette.dark_green,
  dark_red   = palette.dark_red,
}

-- --| gruvbox: light |----------------------------------------------------------------------------------------------
-- stylua: ignore
cat_gruvbox.light = {
  bg0 = palette.light0,
  bg1 = palette.light1,
  bg2 = palette.light2,
  bg3 = palette.light3,
  bg4 = palette.light4,

  fg0 = palette.dark0,
  fg1 = palette.dark1,
  fg2 = palette.dark2,
  fg3 = palette.dark3,
  fg4 = palette.dark4,

  aqua   = palette.faded_aqua,
  blue   = palette.faded_blue,
  gray   = palette.gray,
  green  = palette.faded_green,
  orange = palette.faded_orange,
  purple = palette.faded_purple,
  red    = palette.faded_red,
  yellow = palette.faded_yellow,

  neutral_aqua   = palette.neutral_aqua,
  neutral_blue   = palette.neutral_blue,
  neutral_green  = palette.neutral_green,
  neutral_purple = palette.neutral_purple,
  neutral_red    = palette.neutral_red,
  neutral_yellow = palette.neutral_yellow,

  dark_aqua  = palette.light_aqua,
  dark_green = palette.light_green,
  dark_red   = palette.light_red,
}

