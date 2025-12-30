-- /after/ftplugin/man.lua
-- disabled if below line is active
-- if true then return {} end
-- vim:set softtabstop=2 shiftwidth=2 tabstop=2 expandtab ft=lua:

local opt = vim.opt
local opt_local = vim.opt_local

vim.bo.buflisted = false

opt.cmdheight = 0
opt.laststatus = 0
opt.termguicolors = true

opt_local.colorcolumn = "120"
opt_local.spell = false

vim.keymap.set("n", "q", "<cmd>close<cr>", { desc = "man ft: q to exit manpages" })
