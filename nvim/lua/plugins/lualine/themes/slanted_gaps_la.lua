-- plugins/lualine-themes/slanted-gaps-la.lua
-- disabled if below line is active
-- if true then return {} end

local M = {}

-- src: https://github.com/nvim-lualine/lualine.nvim/blob/master/lua/lualine/
-- local utils = require('lualine.utils.utils')

-- require("utils.la-palettes")
local palette = require("utils.palettes.cat-solarized").main

local colors = {
  red = palette.red,
  grey = palette.base1,
  black = palette.base01,
  white = palette.base3,
  white_dim = palette.base2,
  orange = palette.orange,
  green = palette.green,
  violet = palette.violet,
  cyan = palette.cyan,
  yellow = palette.yellow,
}

-- src: https://github.com/nvim-lualine/lualine.nvim/blob/master/lua/lualine/themes/auto.lua
-- --| lualine auto theme |--------------------------------------------------------------------------------------------
--[[
local autocolors = {
  -- syntax: utils.extract_color_from_hllist(scope, syntaxlist, default)
  fore    = utils.extract_color_from_hllist('fg', { 'Normal', 'StatusLine' }, '#000000'),
  back1   = utils.extract_color_from_hllist('bg', { 'Normal', 'StatusLineNC' }, '#000000'),
  back2   = utils.extract_color_from_hllist('bg', { 'StatusLine' }, '#000000'),

  command = utils.extract_color_from_hllist('fg', { 'Identifier' }, '#000000'),
  insert  = utils.extract_color_from_hllist('fg', { 'String', 'MoreMsg' }, '#000000'),
  normal  = utils.extract_color_from_hllist('bg', { 'PmenuSel', 'PmenuThumb', 'TabLineSel' }, '#000000'),
  replace = utils.extract_color_from_hllist('fg', { 'Number', 'Type' }, '#000000'),:qa
  
  visual  = utils.extract_color_from_hllist('fg', { 'Special', 'Boolean', 'Constant' }, '#000000'),
}
--]]

-- --| theme config |--------------------------------------------------------------------------------------------------
local theme = {
  normal = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.black, bg = colors.white_dim },
    c = { fg = colors.black, bg = colors.white },
    z = { fg = colors.white, bg = colors.black },
  },
  insert = { a = { fg = colors.white, bg = colors.green } },
  visual = { a = { fg = colors.white, bg = colors.orange } },
  replace = { a = { fg = colors.white, bg = colors.violet } },
}

-- --| draw sections |-------------------------------------------------------------------------------------------------
-- prepare sections
local empty = require("lualine.component"):extend()
function empty:draw(default_highlight)
  self.status = ""
  self.applied_separator = ""
  self:apply_highlights(default_highlight)
  self:apply_section_separators()
  return self.status
end

-- Put proper separators and gaps between components in sections
local function process_sections(sections)
  for name, section in pairs(sections) do
    local left = name:sub(9, 10) < "x"
    for pos = 1, name ~= "lualine_z" and #section or #section - 1 do
      table.insert(section, pos * 2, { empty, color = { fg = colors.white, bg = colors.white } })
    end
    for id, comp in ipairs(section) do
      if type(comp) ~= "table" then
        comp = { comp }
        section[id] = comp
      end
      comp.separator = left and { right = "" } or { left = "" }
    end
  end
  return sections
end

local function search_result()
  if vim.v.hlsearch == 0 then
    return ""
  end
  local last_search = vim.fn.getreg "/"
  if not last_search or last_search == "" then
    return ""
  end
  local searchcount = vim.fn.searchcount { maxcount = 9999 }
  return last_search .. "(" .. searchcount.current .. "/" .. searchcount.total .. ")"
end

local function modified()
  if vim.bo.modified then
    return "+"
  elseif vim.bo.modifiable == false or vim.bo.readonly == true then
    return "-"
  end
  return ""
end

-- --| options |-------------------------------------------------------------------------------------------------------
M.options = {
  theme = theme,
  -- theme = "auto",
  component_separators = "",
  section_separators = { left = "", right = "" },
}
M.sections = process_sections {
  lualine_a = {
    "mode",
    {
      "branch",
      color = { bg = colors.violet },
    }
  },
  lualine_b = {
    -- "branch",
    { "diff",
      colored = true,
    },
    {
      "diagnostics",
      source = { "nvim" },
      sections = { "error" },
      diagnostics_color = { error = { bg = colors.red, fg = colors.white } },
    },
    {
      "diagnostics",
      source = { "nvim" },
      sections = { "warn" },
      diagnostics_color = { warn = { bg = colors.yellow, fg = colors.white } },
    },

    {
      "%w",
      cond = function()
        return vim.wo.previewwindow
      end,
    },
    {
      "%r",
      cond = function()
        return vim.bo.readonly
      end,
    },
    {
      "%q",
      cond = function()
        return vim.bo.buftype == "quickfix"
      end,
    },
  },
  lualine_c = {
    { "filename", file_status = false, path = 1 },
    { modified, color = { bg = colors.cyan, fg = colors.white } },
  },
  lualine_x = {},
  lualine_y = { search_result, "filetype" },
  lualine_z = { "%l:%c", "%p%%/%L" },
}
M.inactive_sections = {
  lualine_c = { "%f %y %m" },
  lualine_x = {},
}

return M
