-- /plugins/buffer-tabline.lua
-- disabled if below line is active
-- if true then return {} end

vim.o.showtabline = 2

local solarized_colors = {
  base04 = "#002731",
  base03 = "#002b36",
  base02 = "#073642",
  base01 = "#586E75",
  base00 = "#657B83",
  base0 = "#839496",
  base1 = "#93A1A1",
  base2 = "#EEE8D5",
  base3 = "#FDF6E3",
  base4 = "#fbf3db",
  blue = "#268BD2",
  cyan = "#2AA198",
  orange = "#CB4B16",
  red = "#DC322F",
  violet = "#6C71C4",
  yellow = "#B58900",
  green = "#859900",
  magenta = "#D33682",
}

-- bufferline config source locals
local lazy = require("bufferline.lazy")
-- local utils = lazy.require("bufferline.utils")            ---@module "bufferline.utils"
-- local highlights = lazy.require("bufferline.highlights")  ---@module "bufferline.highlights"
-- local colors = lazy.require("bufferline.colors")          ---@module "bufferline.colors"
local constants = lazy.require("bufferline.constants")    ---@module "bufferline.colors"

-- icons:
-- https://fontawesome.com/cheatsheet
-- https://fontawesome.com/v3/cheatsheet/
-- https://fontawesome.com/v4/cheatsheet/

return {
  {
    -- https://github.com/akinsho/bufferline.nvim
    "akinsho/bufferline.nvim",
    enabled = true,
    opts = {
      ---@type bufferline.Option
      options = {
        themeable = true,
        separator_style = { "", "" }, --   "", ""         
          color_icons = false,
          buffer_close_icon = "",
          -- modified_icon = "●",
          close_icon = "",
          indicator = { icon = constants.indicator, style = "icon" },
          left_trunc_marker = "",
          right_trunc_marker = "",
          -- show_buffer_icons = true,
          -- show_buffer_close_icons = true,
          -- get_element_icon = nil,
          -- show_close_icon = true,
          -- show_tab_indicators = true,
          -- show_duplicate_prefix = true,
        offsets = {
          {
            filetype = "Neotree",
            text = "File Explorer",
            highlight = "Directory",
            separator = true, -- use a "true" to enable the default, or set your own character
          },
        },
      },
      highlights = {
        -- --- [ BACKGROUNDEST ] ---
        fill = { -- under buffers
          bg = solarized_colors.base3,  -- probably text of under buffers
          fg = solarized_colors.base3,  --
        },
        background = { -- unfocused buffers?
          fg = solarized_colors.base3,  -- background of background buffers
          bg = solarized_colors.base01, -- text of background buffers
        },
        -- --- [ BUFFERS ] ---
        buffer_selected = { -- selected buffer...
          italic = false,
          bold = false,
          underline = true,
          fg = solarized_colors.base3,
          bg = solarized_colors.orange, -- text of selected buffer
        },
        buffer_visible = { -- buffer that's not selected
          fg = solarized_colors.base3,
          bg = solarized_colors.base01,
        },
        -- --- [ TABS ] ---
        tab = { -- on right side of nvim's window
          fg = solarized_colors.base3,
          bg = solarized_colors.base01,
        },
        tab_close = {
          fg = solarized_colors.base3,
          bg = solarized_colors.base01,
        },
        tab_selected = {
          fg = solarized_colors.base3,
          bg = solarized_colors.orange,
          underline = true,
        },
        -- --- [ TAB SEPARATORS ] ---
        tab_separator = {
          fg = solarized_colors.base3,
          bg = solarized_colors.base01,
        },
        tab_separator_selected = {
          fg = solarized_colors.base3,
          bg = solarized_colors.base01,  --
          sp = solarized_colors.cyan,  -- sp = special
          underline = true,
        },
        -- --- [ BUFFER SEPARATORS ] ---
        offset_separator = { -- separator between buffer "tabs" when indow focused
          fg = solarized_colors.base3,
          bg = solarized_colors.base01,
        },
        separator = { -- separator between buffer "tabs" when window focused
          fg = solarized_colors.base3,
          bg = solarized_colors.base01,
        },
        separator_selected = { -- separator between buffer "tabs", idk if they can be selected lol
          fg = solarized_colors.base03,
          bg = solarized_colors.orange,
        },
        separator_visible = { -- separator between buffer "tabs" when window not focused
          fg = solarized_colors.base01,
          bg = solarized_colors.base3,
        },
        -- --- [ BUFFER EXISTENCE INDICATOR ] ---
        indicator_visible = { -- left side by filetype icon
          fg = solarized_colors.base3,
          bg = solarized_colors.base3,
        },
        indicator_selected = { -- left side by filetype icon
          fg = solarized_colors.base3,  -- background?
          bg = solarized_colors.base3,  -- foreground?
          underline = false,
        },
        -- --- [ BUFFER MODIFIED INDICATOR ] ---
        modified = {
          fg = solarized_colors.base3,
          bg = solarized_colors.cyan,
        },
        modified_selected = {
          fg = solarized_colors.base3,
          bg = solarized_colors.cyan,
          bold = false,
          italic = false,
          underline = false,
        },
        modified_visible = {
          fg = solarized_colors.base3,
          bg = solarized_colors.cyan, --
        },
        -- --- [ BUFFER DUPLICATE INDICATOR ] ---
        duplicate = {
          fg = solarized_colors.base3,
          bg = solarized_colors.blue,
        },
        duplicate_selected = {
          fg = solarized_colors.base3,
          bg = solarized_colors.blue,
          bold = false,
          italic = false,
          underline = true,
        },
        duplicate_visible = {
          fg = solarized_colors.red,
          bg = solarized_colors.blue,
        },
        -- --- [ BUFFER NAME TRUNCATED INDICATOR ] ---
        trunc_marker = {
          fg = solarized_colors.base3,
          bg = solarized_colors.cyan,
        },
        -- --- [ BUFFER PICK INDICATOR ] ---
        pick = {
          fg = solarized_colors.base3,
          bg = solarized_colors.red,
        },
        pick_selected = {
          fg = solarized_colors.base3,
          bg = solarized_colors.red,
          bold = false,
          italic = false,
          underline = true,
        },
        pick_visible = {
          fg = solarized_colors.base3,
          bg = solarized_colors.red,
        },
        -- --- [ BUFFER CLOSE BUTTON ] ---
        close_button = {
          fg = solarized_colors.base3,
          bg = solarized_colors.base01,
        },
        close_button_selected = {
          fg = solarized_colors.base3,
          bg = solarized_colors.orange,
        },
        close_button_visible = { -- right of name of buffer when window is not selected
          fg = solarized_colors.base3,  -- background
          bg = solarized_colors.base01,
        },
        -- --- [ NUMBERS? ] ---
        numbers = {
          fg = solarized_colors.base3,
          bg = solarized_colors.base01,
        },
        numbers_selected = {
          fg = solarized_colors.base3,
          bg = solarized_colors.orange,
          bold = false,
          italic = false,
          underline = true,
        },
        numbers_visible = {
          fg = solarized_colors.red,
          bg = solarized_colors.green, --
        },
        -- --- [ BUFFER LSP LIGHTBULB INDICATOR ] ---
        hint = { -- when lightbulb lsp diagnostic
          fg = solarized_colors.base3,  -- background
          bg = solarized_colors.green,  -- foreground
        },
        hint_selected = { -- when lightbulb lsp diagnostic
          fg = solarized_colors.base3,  -- background
          bg = solarized_colors.green,  -- foreground
          bold = false,
          italic = false,
          underline = true,
        },
        hint_visible = { -- when lightbulb lsp diagnostic
          fg = solarized_colors.base3,
          bg = solarized_colors.green,
        },
        -- --- [ BUFFER INFO INDICATOR ] ---
        info = {
          fg = solarized_colors.base3,
          bg = solarized_colors.blue,
        },
        info_selected = {
          fg = solarized_colors.base3,
          bg = solarized_colors.blue,
          bold = false,
          italic = false,
          underline = true,
        },
        info_visible = {
          fg = solarized_colors.base3,
          bg = solarized_colors.blue,
        },
        -- --- [ BUFFER LSP INFO INDICATOR ] ---
        info_diagnostic = {
          fg = solarized_colors.base3,
          bg = solarized_colors.blue,
        },
        info_diagnostic_selected = {
          fg = solarized_colors.base3,
          bg = solarized_colors.blue,
          bold = false,
          italic = false,
          underline = true,
        },
        info_diagnostic_visible = {
          fg = solarized_colors.base3,
          bg = solarized_colors.blue,
        },
        -- --- [ BUFFER WARNING INDICATOR ] ---
        warning = {
          fg = solarized_colors.base3,
          bg = solarized_colors.yellow,
        },
        warning_selected = {
          fg = solarized_colors.base3,
          bg = solarized_colors.yellow,
          bold = false,
          italic = false,
          underline = true,
        },
        warning_visible = {
          fg = solarized_colors.base3,
          bg = solarized_colors.yellow,
        },
        -- --- [ BUFFER LSP WARNING INDICATOR ] ---
        warning_diagnostic = {
          fg = solarized_colors.base3,
          bg = solarized_colors.yellow,
        },
        warning_diagnostic_selected = {
          fg = solarized_colors.base3,
          bg = solarized_colors.yellow,
          bold = false,
          italic = false,
          underline = true,
        },
        warning_diagnostic_visible = {
          fg = solarized_colors.base3,
          bg = solarized_colors.yellow,
        },
        -- --- [ BUFFER ERROR INDICATOR ] ---
        error = {
          fg = solarized_colors.base3,
          bg = solarized_colors.red,
        },
        error_selected = {
          fg = solarized_colors.base3,
          bg = solarized_colors.red,
          bold = false,
          italic = false,
          underline = true,
        },
        error_visible = {
          fg = solarized_colors.base3,
          bg = solarized_colors.red,
        },
        -- --- [ BUFFER LSP ERROR INDICATOR ] ---
        error_diagnostic = {
          fg = solarized_colors.base3,
          bg = solarized_colors.red,
        },
        error_diagnostic_selected = {
          fg = solarized_colors.base3,
          bg = solarized_colors.red,
          bold = false,
          italic = false,
          underline = true,
        },
        error_diagnostic_visible = {
          fg = solarized_colors.base3,
          bg = solarized_colors.red,
        },
      },
    },
  },
}
