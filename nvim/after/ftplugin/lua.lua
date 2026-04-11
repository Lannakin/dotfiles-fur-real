-- /after/ftplugin/lua.lua
-- disabled if below line is active
-- if true then return {} end
-- https://github.com/dpetka2001/dotfiles/tree/main/dot_config/nvim/after/ftplugin

local opt = vim.opt_local

opt.autoindent = true
opt.expandtab = true
opt.shiftwidth = 2
opt.smarttab = true
opt.softtabstop = 2
opt.tabstop = 2

opt.textwidth = 120
opt.colorcolumn = "121"
