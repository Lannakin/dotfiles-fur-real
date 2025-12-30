-- init.lua

vim.o.winborder = "single"
vim.cmd("filetype plugin on")

-- bootstrap lazy.nvim, LazyVim and your plugins
require "utils.palettes.cat-solarized" -- needs to be loaded early to initialize tables
require "config.lazy"
