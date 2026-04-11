-- ./after/ftplugin/sh.lua
-- disabled if below line is active
-- if true then return {} end
-- https://github.com/dpetka2001/dotfiles/tree/main/dot_config/nvim/after/ftplugin
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local opt = vim.opt_local

-- --| set PKGBUILD to bash |------------------------------------------------------------------------------------------
autocmd({ "BufNewFile", "BufRead" }, {
  group = augroup("ShellSyntax", { clear = true }),
  pattern = { "PKGBUILD" },
  callback = function()
  vim.opt.filetype = "sh"
  end,
  desc = "Set filetype to sh for certain types of config files",
})

opt.errorformat = "%f:%l:%c: %t%*[^:]:%m,%f:%l:%c: %t%*[^:]:%m,%-G%.%#"

opt.autoindent = true
opt.expandtab = true
opt.shiftwidth = 4
opt.smarttab = true
opt.tabstop = 4

opt.textwidth = 80
opt.colorcolumn = "81"
