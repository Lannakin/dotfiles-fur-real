-- /after/ftplugin/c.lua
-- disabled if below line is active
-- if true then return {} end
-- https://github.com/dpetka2001/dotfiles/tree/main/dot_config/nvim/after/ftplugin

local opt = vim.opt_local

opt.autoindent = true
opt.errorformat = "%f:%l:%c: %t%*[^:]:%m,%f:%l:%c: %t%*[^:]:%m,%-G%.%#"
opt.expandtab = true
opt.makeprg = "gcc -Wall -o %:r %"
opt.shiftwidth = 4
opt.smarttab = true
opt.tabstop = 4
opt.textwidth = 80
