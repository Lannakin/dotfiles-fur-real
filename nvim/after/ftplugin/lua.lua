-- /after/ftplugin/lua.lua
-- disabled if below line is active
-- if true then return {} end
-- https://github.com/dpetka2001/dotfiles/tree/main/dot_config/nvim/after/ftplugin
local opt = vim.opt_local

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.textwidth = 120
opt.autoindent = true
opt.smarttab = true
