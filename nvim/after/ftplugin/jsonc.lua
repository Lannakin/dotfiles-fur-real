-- ./after/ftplugin/jsonc.lua
-- disabled if below line is active
-- if true then return {} end
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local opt = vim.opt_local

-- --| set filetype to jsonc |-----------------------------------------------------------------------------------------
autocmd({ "BufNewFile", "BufRead" }, {
  group = augroup("JsonCSyntax", { clear = true }),
  pattern = { "*rc.json" },
  callback = function()
    vim.opt.filetype = "jsonc"
  end,
  desc = "Set filetype to jsonc for json files",
})

opt.autoindent = true
opt.expandtab = true
opt.shiftwidth = 2
opt.smarttab = true
opt.softtabstop = 2
opt.tabstop = 4

opt.commentstring = '#%s'
opt.iskeyword:append('_')
opt.list = true
opt.spell = false

opt.textwidth = 100
opt.colorcolumn = "101"
