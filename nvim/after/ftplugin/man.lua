-- Filename: ~/.config/nvim/after/ftplugin/man.lua
-- Last Change: Wed, 09 Nov 2022 17:40:52
-- vim:set softtabstop=2 shiftwidth=2 tabstop=2 expandtab ft=lua:

local opt = vim.opt

vim.bo.buflisted = false
opt.cmdheight = 0
opt.laststatus = 0
opt.termguicolors = true

vim.opt_local.colorcolumn = "120"
vim.opt_local.spell = false

vim.keymap.set('n', 'q', '<cmd>close<cr>', { desc = 'man ft: q to exit manpages' })
