-- /after/ftplugin/markdown.lua
-- disabled if below line is active
if true then return {} end

local opt = vim.opt_local
local map = vim.keymap.set

vim.g.markdown_fenced_languages = {
  "lua",
  "vim",
  "sh",
  "c",
  "cpp",
  "txt",
}

-- --| VIM LOCAL - MARKDOWN OPTIONS |----------------------------------------------------------------------------------
opt.colorcolumn = "80"
opt.list = false
opt.relativenumber = false
opt.suffixesadd:prepend ".md"

opt.tabstop = 2
opt.textwidth = 80

opt.spell = true
opt.spelllang = { "en" }

-- --| KEYMAPS |-------------------------------------------------------------------------------------------------------
map({ "n", "x" }, "]#", [[/^#\+ .*<CR>]], { desc = "Next Heading", buffer = true })
map({ "n", "x" }, "[#", [[?^#\+ .*<CR>]], { desc = "Prev Heading", buffer = true })
map({ "n", "x" }, "gj", [[/^#\+ .*<CR>]], { desc = "Next Heading", buffer = true })
map({ "n", "x" }, "gk", [[?^#\+ .*<CR>]], { desc = "Prev Heading", buffer = true })

-- Bold selected text
map("n", "<C-b>", function()
  vim.cmd("normal viw")
  vim.cmd("normal 2gsa*")
end, { desc = "Bold Selection" })
map("v", "<C-b>", function()
  vim.cmd("normal 2gsa*")
end, { desc = "Bold Selection" })

-- stylua: ignore start
if LazyVim.has("markdowny.nvim") then
  map("v", "<C-b>", function() require('markdowny').bold() end, { buffer = 0 })
  map("v", "<C-i>", function() require('markdowny').italic() end, { buffer = 0 })
  map("v", "<C-k>", function() require('markdowny').link() end, { buffer = 0 })
  map("v", "<C-e>", function() require('markdowny').code() end, { buffer = 0 })
end

