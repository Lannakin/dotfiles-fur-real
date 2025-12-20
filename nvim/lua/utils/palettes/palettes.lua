-- utils/palettes.lua
-- disabled if below line is active
if true then return {} end

-- --| cat_selenized |-----------------------------------------------------------------------------------------------------

--- create palette tables for cat_selenized color theme
---@class cat_selenized
local cat_selenized = {}

-- src: https://github.com/Tsuzat/NeoSolarized.nvim/blob/master/lua/NeoSolarized/config.lua
--- default settings: dark palette
---@class defaults
local defaults = {
  palette_mode = "dark",
}

--- initialize options or something
cat_selenized.options = nil

-- --| cat_selenized: setup |------------------------------------------------------------------------------------------

--- create dark and light mode palette tables swapping for cat_selenized
---@param options string|table
---@return string|table
function cat_selenized.setup(options)

  cat_selenized.options = vim.tbl_deep_extend("force", {}, defaults, options or {})
  cat_selenized.options.palette_mode = "dark"

  if vim.o.background == "light" then
    cat_selenized.options.palette_mode = cat_selenized.light
    print("utils.cat-neosolarized: palette_mode = light")
  else
    cat_selenized.options.palette_mode = cat_selenized.dark
    print("utils.cat-neosolarized: palette_mode = dark")
  end
  return cat_selenized.options.palette_mode
end
-- stylua: ignore start

-- --| cat_solarized: main |-------------------------------------------------------------------------------------------

-- +---------------------------------------------------------+
-- |                                                         |
-- |                          HEX                            |
-- |                                                         |
-- +---------------------------------------------------------+

--- cat_solarized: base palette colors to be used by dark and light palette_mode
--[[
=================================================================================
|| NAME    || RGB                   || OKLCH                || HEX      "APPLE"||
=================================================================================

selenized dark
--------------
bg_0         = "#103C48",
bg_1         = "#184956",
bg_2         = "#2D5B69",
dim_0        = "#72898F",
fg_0         = "#ADBCBC",
fg_1         = "#CAD8D9",

red          = "#FA5750",
green        = "#75B938",
yellow       = "#DBB32D",
blue         = "#4695F7",
magenta      = "#F275BE",
cyan         = "#36C6B8",
orange       = "#ED8649",
violet       = "#AF88EB",

br_red       = "#FF665C",
br_green     = "#84C747",
br_yellow    = "#EBC13D",
br_blue      = "#58A3FF",
br_magenta   = "#FF84CD",
br_cyan      = "#53D6C7",
br_orange    = "#FD9456",
br_violet    = "#BD96FA",

selenized light
---------------
bg_0         = "#FBF3DB",
bg_1         = "#ECE3CC",
bg_2         = "#D5CDB6",
dim_0        = "#909995",
fg_0         = "#53676D",
fg_1         = "#3A4D53",

red          = "#D2212D",
green        = "#489100",
yellow       = "#AD8900",
blue         = "#0072D4",
magenta      = "#CA4898",
cyan         = "#009C8F",
orange       = "#C25D1E",
violet       = "#8762C6",

br_red       = "#CC1729",
br_green     = "#428B00",
br_yellow    = "#A78300",
br_blue      = "#006DCE",
br_magenta   = "#C44392",
br_cyan      = "#00978A",
br_orange    = "#BC5819",
br_violet    = "#825DC0",

selenized white
---------------
bg_0         = "#FFFFFF",
bg_1         = "#EBEBEB",
bg_2         = "#CDCDCD",
dim_0        = "#878787",
fg_0         = "#474747",
fg_1         = "#282828",

red          = "#D6000C",
green        = "#1D9700",
yellow       = "#C49700",
blue         = "#0064E4",
magenta      = "#DD0F9D",
cyan         = "#00AD9C",
orange       = "#D04A00",
violet       = "#7F51D6",

br_red       = "#BF0000",
br_green     = "#008400",
br_yellow    = "#AF8500",
br_blue      = "#0054CF",
br_magenta   = "#C7008B",
br_cyan      = "#009A8A",
br_orange    = "#BA3700",
br_violet    = "#6B40C3",

selenized black
---------------
bg_0         = "#181818",
bg_1         = "#252525",
bg_2         = "#3B3B3B",
dim_0        = "#777777",
fg_0         = "#B9B9B9",
fg_1         = "#DEDEDE",

red          = "#ED4A46",
green        = "#70B433",
yellow       = "#DBB32D",
blue         = "#368AEB",
magenta      = "#EB6EB7",
cyan         = "#3FC5B7",
orange       = "#E67F43",
violet       = "#A580E2",

br_red       = "#FF5E56",
br_green     = "#83C746",
br_yellow    = "#EFC541",
br_blue      = "#4F9CFE",
br_magenta   = "#FF81CA",
br_cyan      = "#56D8C9",
br_orange    = "#FA9153",
br_violet    = "#B891F5",
--]]

return cat_selenized
