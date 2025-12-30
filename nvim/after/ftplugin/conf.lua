-- /after/ftplugin/conf.lua
-- disabled if below line is active
-- if true then return {} end

local opt = vim.opt_local

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

opt.textwidth = 80
opt.colorcolumn = "80"
