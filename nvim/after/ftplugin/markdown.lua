-- /after/ftplugin/markdown.lua

local opt = vim.opt_local

vim.g.markdown_fenced_languages = {
  "lua",
  "vim",
  "sh",
  "c",
  "cpp",
}

-- [ VIM LOCAL - MARKDOWN OPTIONS ] --
opt.list = false
opt.relativenumber = false
opt.suffixesadd:prepend ".md"

-- opt.tabstop = 4
-- opt.textwidth = 80

opt.spell = true
opt.spelllang = { "en" }
