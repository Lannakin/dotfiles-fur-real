-- /after/ftplugin/c.lua
-- disabled if below line is active
-- if true then return {} end
-- https://github.com/dpetka2001/dotfiles/tree/main/dot_config/nvim/after/ftplugin
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.expandtab = true
vim.opt_local.textwidth = 80
vim.opt_local.autoindent = true
vim.opt_local.smarttab = true
vim.opt_local.makeprg = "gcc -Wall -o %:r %"
vim.opt_local.errorformat = "%f:%l:%c: %t%*[^:]:%m,%f:%l:%c: %t%*[^:]:%m,%-G%.%#"
