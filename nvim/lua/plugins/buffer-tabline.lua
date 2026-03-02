-- /plugins/buffer-tabline.lua
-- disabled if below line is active
-- if true then return {} end

local bufferline = require "bufferline"

local palette = require("utils.palettes.cat-solarized").main

local colors = {
  base04  = palette.base04,
  base03  = palette.base03,
  base02  = palette.base02,
  base01  = palette.base01,
  base00  = palette.base00,
  base0   = palette.base0,
  base1   = palette.base1,
  base2   = palette.base2,
  base3   = palette.base3,
  base4   = palette.base4,
  blue    = palette.blue,
  cyan    = palette.cyan,
  orange  = palette.orange,
  red     = palette.red,
  violet  = palette.violet,
  yellow  = palette.yellow,
  green   = palette.green,
  magenta = palette.magenta,

}

-- theme color variables that I have yet to migrate to my /utils/palettes system
--[[
local solarized_colors = {
  base04  = "#002731",
  base03  = "#002b36",
  base02  = "#073642",
  base01  = "#586E75",
  base00  = "#657B83",
  base0   = "#839496",
  base1   = "#93A1A1",
  base2   = "#EEE8D5",
  base3   = "#FDF6E3",
  base4   = "#FBF3DB",
  blue    = "#268BD2",
  cyan    = "#2AA198",
  orange  = "#CB4B16",
  red     = "#DC322F",
  violet  = "#6C71C4",
  yellow  = "#B58900",
  green   = "#859900",
  magenta = "#D33682",
}
--]]
-- stylua: ignore

-- icons cheatsheets:
-- https://fontawesome.com/cheatsheet
-- https://fontawesome.com/v3/cheatsheet/
-- https://fontawesome.com/v4/cheatsheet/

---@type LazySpec
return {
  {
    -- https://github.com/akinsho/bufferline.nvim
    "akinsho/bufferline.nvim",
    enabled = true,
    version = false,
    dependencies = { "DaikyXendo/nvim-material-icon", opts = {} },
    opts = function()
      return {
        ---@type bufferline.Options
        options = {
          style_preset = bufferline.style_preset.minimal,

          themeable = true,
          numbers = "none", -- "buffer_id", "ordinal", "both"
          separator_style = { "", "" }, --   "", ""         

          color_icons = true,
          buffer_close_icon = "",
          -- modified_icon = "●",
          close_icon = "",

          indicator = { style = "underline" }, -- old icon = constants.indicator
          -- left_trunc_marker = "",
          -- right_trunc_marker = "",
          -- show_buffer_icons = true,
          -- get_element_icon = nil,

          show_buffer_close_icons = false,
          show_close_icon = false,
          -- show_tab_indicators = true,
          -- show_duplicate_prefix = true,
          always_show_bufferline = true,
          auto_toggle_bufferline = true,

          -- stylua: ignore start
          close_command = function(n) Snacks.bufdelete(n) end,
          right_mouse_command = function(n) Snacks.bufdelete(n) end,
          -- stylua: ignore end

          offsets = {
            {
              filetype = "neo-tree",
              text = "FILE EXPLORER",
              highlight = "Directory",
              text_align = "left",
              separator = true,
            },
            {
              filetype = "Outline",
              text = "Symbols Outline",
              highlight = "TSType",
              text_align = "left",
            },
          },
          hover = { enabled = false },
        },

        -- +-----------------------------+
        -- |   BUFFERLINE THEME COLORS   |
        -- +-----------------------------+
        -- stylua: ignore
        highlights = {
          -- sp = special; color of the indicator in indicator_style

          -- --| BASE / BACKGROUND COLORS |----------------------------------------------------------------------------
          fill = { -- under buffers
            bg = colors.base3,
            fg = colors.base3,
          },
          background = { -- unfocused buffers?
            bg = colors.base3,  -- background of background buffers
            fg = colors.base01, -- text of background buffers
          },

          -- --| BUFFERS |---------------------------------------------------------------------------------------------
          --- [ BASE BUFFER COLORS ] ---
          buffer_selected = { -- selected buffer...
            bg = colors.base3,
            fg = colors.orange, -- text of selected buffer
            sp = colors.orange, -- color of special
            italic = false,
            bold = false,
            underline = true,
          },
          buffer_visible = { -- buffer that's not selected
            bg = colors.base3,
            fg = colors.base01,
          },
          --- [ BUFFER SEPARATORS ] ---
          offset_separator = { -- separator between offset and buffers
            bg = colors.base3,
            fg = colors.cyan,
          },
          separator = { -- separator between buffer "tabs" when window focused
            fg = colors.base01,
            bg = colors.base3,
          },
          separator_selected = { -- separator between buffer "tabs", idk if they can be selected lol
            fg = colors.orange,
            -- bg = colors.orange,
            sp = colors.orange, -- color of special
          },
          separator_visible = { -- separator between buffer "tabs" when window not focused
            fg = colors.base01,
            bg = colors.base3,
          },

          -- --| TABS |------------------------------------------------------------------------------------------------
          --- [ BASE TAB COLORS ] ---
          tab = { -- on right side of nvim's window
            bg = colors.base3,
            fg = colors.base01,
          },
          tab_close = {
            bg = colors.base3,
            fg = colors.base01,
          },
          tab_selected = {
            bg = colors.base3,
            fg = colors.orange,
            sp = colors.orange, -- color of special
            underline = true,
          },
          --- [ TAB SEPARATORS ] ---
          tab_separator = {
            bg = colors.base3,
            fg = colors.orange,
          },
          tab_separator_selected = {
            fg = colors.orange,
            -- bg = normal_bg,
            -- sp = colors.cyan,
            underline = false,
          },
          --- [ TAB NUMBERS ] ---
          numbers = {
            fg = colors.base01,
            bg = colors.base3,
          },
          numbers_selected = {
            bg = colors.base3,
            fg = colors.orange,
            sp = colors.orange, -- color of special
            bold = false,
            italic = false,
            underline = true,
          },
          numbers_visible = {
            fg = colors.base01,
            bg = colors.base3,
          },

          -- --| BUFFER INDICATORSL MAIN |-----------------------------------------------------------------------------
          --- [ BUFFER EXISTENCE INDICATOR ] ---
          indicator_visible = { -- left side by filetype icon
            bg = colors.base3,
            fg = colors.base3,
            underline = false,
          },
          indicator_selected = { -- left side by filetype icon
            bg = colors.base3,
            fg = colors.base3,
            sp = colors.orange, -- color of special
            -- underline = false,
          },
          --- [ BUFFER MODIFIED INDICATOR ] ---
          modified = {
            fg = colors.cyan,
            bg = colors.base3,
          },
          modified_selected = {
            fg = colors.cyan,
            bg = colors.base3,
            bold = false,
            italic = false,
            underline = false,
          },
          modified_visible = {
            fg = colors.cyan,
            bg = colors.base3,
          },
          --- [ BUFFER DUPLICATE INDICATOR ] ---
          duplicate = {
            bg = colors.base3,
            fg = colors.blue,
          },
          duplicate_selected = {
            bg = colors.base3,
            fg = colors.blue,
            bold = false,
            italic = false,
            sp = colors.orange, -- color of special
            -- underline = true,
          },
          duplicate_visible = {
            bg = colors.base3,
            fg = colors.blue,
          },
          --- [ BUFFER NAME TRUNCATED INDICATOR ] ---
          trunc_marker = {
            bg = colors.base3,
            fg = colors.cyan,
          },
          --- [ BUFFER PICK INDICATOR ] ---
          pick = {
            bg = colors.base3,
            fg = colors.violet,
          },
          pick_selected = {
            bg = colors.base3,
            fg = colors.violet,
            sp = colors.violet, -- color of special
            bold = false,
            italic = false,
            -- underline = true,
          },
          pick_visible = {
            bg = colors.base3,
            fg = colors.violet,
          },
          --- [ BUFFER CLOSE BUTTON ] ---
          close_button = {
            bg = colors.base01,
            fg = colors.base3,
          },
          close_button_selected = {
            bg = colors.orange,
            fg = colors.base3,
          },
          close_button_visible = { -- right of name of buffer when window is not selected
            bg = colors.base01,
            fg = colors.base3,
          },

          -- --| BUFFER INDICATORS: LSP |------------------------------------------------------------------------------
          --- [ BUFFER LSP LIGHTBULB INDICATOR ] ---
          hint = { -- when lightbulb lsp diagnostic
            bg = colors.base3,
            fg = colors.green,
          },
          hint_selected = { -- when lightbulb lsp diagnostic
            bg = colors.base3,
            fg = colors.green,
            bold = false,
            italic = false,
            underline = true,
          },
          hint_visible = { -- when lightbulb lsp diagnostic
            bg = colors.base3,
            fg = colors.green,
          },
          --- [ BUFFER INFO INDICATOR ] ---
          info = {
            fg = colors.base3,
            bg = colors.blue,
          },
          info_selected = {
            bg = colors.blue,
            fg = colors.base3,
            bold = false,
            italic = false,
            -- underline = true,
          },
          info_visible = {
            fg = colors.blue,
            bg = colors.base3,
          },
          --- [ BUFFER LSP INFO INDICATOR ] ---
          info_diagnostic = {
            fg = colors.blue,
            bg = colors.base3,
          },
          info_diagnostic_selected = {
            fg = colors.blue,
            bg = colors.base3,
            bold = false,
            italic = false,
            -- underline = true,
          },
          info_diagnostic_visible = {
            fg = colors.blue,
            bg = colors.base3,
          },
          --- [ BUFFER WARNING INDICATOR ] ---
          warning = {
            fg = colors.yellow,
            bg = colors.base3,
          },
          warning_selected = {
            fg = colors.yellow,
            bg = colors.base3,
            sp = colors.orange, -- color of special
            bold = false,
            italic = false,
            -- underline = true,
          },
          warning_visible = {
            fg = colors.yellow,
            bg = colors.base3,
          },
          --- [ BUFFER LSP WARNING INDICATOR ] ---
          warning_diagnostic = {
            fg = colors.yellow,
            bg = colors.base3,
          },
          warning_diagnostic_selected = {
            fg = colors.yellow,
            bg = colors.base3,
            sp = colors.orange, -- color of special
            bold = false,
            italic = false,
            -- underline = true,
          },
          warning_diagnostic_visible = {
            fg = colors.yellow,
            bg = colors.base3,
          },
          --- [ BUFFER ERROR INDICATOR ] ---
          error = {
            fg = colors.red,
            bg = colors.base3,
          },
          error_selected = {
            fg = colors.red,
            bg = colors.base3,
            sp = colors.orange, -- color of special
            bold = false,
            italic = false,
            -- underline = true,
          },
          error_visible = {
            fg = colors.red,
            bg = colors.base3,
          },
          --- [ BUFFER LSP ERROR INDICATOR ] ---
          error_diagnostic = {
            fg = colors.red,
            bg = colors.base3,
          },
          error_diagnostic_selected = {
            fg = colors.red,
            bg = colors.base3,
            sp = colors.orange, -- color of special
            bold = false,
            italic = false,
            -- underline = true,
          },
          error_diagnostic_visible = {
            fg = colors.red,
            bg = colors.base3,
          },
        },
      }
    end,
  },
}
