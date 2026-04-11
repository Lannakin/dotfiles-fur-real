-- ./after/ftplugin/text.lua
-- disabled if below line is active
-- if true then return {} end

local opt = vim.opt_local

opt.autoindent = true
opt.expandtab = true
opt.shiftwidth = 2
opt.smarttab = true
opt.tabstop = 2

opt.commentstring = ">%s"

opt.textwidth = 80
opt.colorcolumn = "81"

opt.list = true
