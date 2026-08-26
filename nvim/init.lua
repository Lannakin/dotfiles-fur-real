-- init.lua

vim.o.winborder = "single"
vim.cmd("filetype plugin on")
vim.opt.viminfo = "h,<10,s10,'50,n~/.local/var/cache/nvim/nviminfo"

-- bootstrap lazy.nvim, LazyVim and your plugins
require "utils.palettes.cat-solarized" -- needs to be loaded early to initialize tables
require "config.lazy"
