-- /after/ftplugin/cpp.lua
-- disabled if below line is active
-- if true then return {} end
-- https://github.com/dpetka2001/dotfiles/tree/main/dot_config/nvim/after/ftplugin

local opt = vim.opt_local

opt.errorformat = "%f:%l:%c: %t%*[^:]:%m,%f:%l:%c: %t%*[^:]:%m,%-G%.%#"
-- opt.makeprg = "gcc -Wall -o %:r %"

opt.autoindent = true
opt.expandtab = true
opt.shiftwidth = 4
opt.smarttab = true
opt.tabstop = 4

opt.textwidth = 80
opt.colorcolumn = "81"
