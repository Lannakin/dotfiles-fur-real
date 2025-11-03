-- /config/keymaps.lua
---@diagnostic disable: undefined-global
-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local unmap = vim.keymap.del

local Diagnostics = require "utils.jellydn_diagnostics"

-- ---[ v stolen from MeteorNvim v ]---
-- src: https://github.com/MeteorNvim/MeteorNvim/blob/main/lua/userconfig/mappings.lua

-- Neotree
map({ "i", "n" }, "<C-B>", "<CMD>:Neotree toggle<CR>", { desc = "Toggle Neotree pane" })

-- Theme switcher --
map("n", "<Leader>t", ":Telescope themes<CR>", { desc = "Theme Switcher", noremap = true, silent = true })

-- Hover --
map("n", "<Leader>h", ":lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })

-- Signature Help --
map(
  "n",
  "<Leader>ls",
  ":lua vim.lsp.buf.signature_help()<CR>",
  { desc = "LSP signature help", noremap = true, silent = true }
)
map("n", "<Leader>l", ":noh<CR>", { desc = "LSP signature help", noremap = true, silent = true })

-- Format --
map("n", "<Leader>f", ":lua vim.lsp.buf.format()<CR>", { desc = "Format document", noremap = true, silent = true })

-- Renamer --
map("n", "<Leader>r", ":lua require('renamer').rename()<CR>", { desc = "Rename", noremap = true, silent = true })

-- Code Actions --
map(
  "n",
  "<Leader>c",
  ":lua require('telescope').extensions.code_actions.code_actions()<CR>",
  { desc = "Code actions", noremap = true, silent = true }
)
map("n", "<Leader>gg", ":goto<CR>", { desc = "Code actions: go to" })

-- Ctrl+Delete --
map("i", "<C-BS>", "<C-w>", { desc = "Delete next word" })
map("i", "<C-h>", "<C-w>", { desc = "Delete next word" })

-- Splits --
map("n", "<leader>sv", ":vsp<CR>", { desc = "", noremap = true })
map("n", "<leader>sh", ":sp<CR>", { desc = "", noremap = true })

-- Clipboard Functions --
map({ "i", "n", "v" }, "<C-C>", '"+y', { desc = "Copy to system clipboard", silent = true })
map({ "i", "n", "v" }, "<C-V>", '"+p', { desc = "Paste from system clipboard", silent = true })
map({ "i", "n", "v" }, "<C-X>", '"+d', { desc = "Cut to system clipboard", silent = true })

-- Undo --
map("n", "<C-Z>", ":u<CR>", { desc = "Undo" })
map("i", "<C-Z>", "<c-o>:u<CR>", { desc = "Undo" })
map("v", "<C-Z>", "<ESC>:u<CR>", { desc = "Undo" })

-- Redo --
map("n", "<C-Y>", ":redo<CR>", { desc = "Redo" })
map("i", "<C-Y>", "<c-o>:redo<CR>", { desc = "Redo" })
map("v", "<C-Y>", "<ESC> :redo<CR>", { desc = "Redo" })

-- Ctrl+Delete --
map("i", "<C-BS>", "<C-w>", { desc = "Control Delete" })
map("i", "<C-h>", "<C-w>", { desc = "Control Delete" })

-- Select all --
map("n", "<C-A>", "ggVG", { desc = "Select all", silent = true })
map("i", "<C-A>", "<c-o>gg<c-o>VG<cr>", { desc = "Select all", silent = true })

-- Move Selection --
map("v", "<TAB>", ">gv", { desc = "Move selection right" })
map("v", "<S-TAB>", "<gv", { desc = "Move selection left" })

-- Delete Selection in Visual Mode --
map("v", "<BS>", [["_d]], { desc = "Delete selection" })

-- Delete Without Overriding Last ClipboardYank --
map("n", "<C-K>", [["_dd]], { desc = "Clipboard-safe delete" })
map("i", "<C-K>", [[<c-o>"_dd]], { desc = "Clipboard-safe delete" })
map("v", "<C-K>", [["_d]], { desc = "Clipboard-safe delete" })

-- BufferLine Next / Prev --
-- next
map("n", "<C-PageDown>", ":BufferLineCycleNext<CR>", { desc = "Cycle to next BufferLine" })
map("i", "<C-PageDown>", "<c-o>:BufferLineCycleNext<CR>", { desc = "Cycle to next BufferLine" })
-- prev
map("n", "<C-PageUp>", ":BufferLineCyclePrev<CR>", { desc = "Cycle to previous BufferLine" })
map("i", "<C-PageUp>", "<c-o>:BufferLineCyclePrev<CR>", { desc = "Cycle to previous BufferLine" })

-- Bufferline Move Tab --
-- next
map("n", "<C-ScrollWheelUp>", ":BufferLineMoveNext<CR>", { desc = "Move BufferLine to next position" })
map("i", "<C-ScrollWheelUp>", "<c-o>:BufferLineMoveNext<CR>", { desc = "Move BufferLine to next position" })
-- prev
map("n", "<C-ScrollWheelDown>", ":BufferLineMovePrev<CR>", { desc = "Move BufferLine to previous position" })
map("i", "<C-ScrollWheelDown>", "<c-o>:BufferLineMovePrev<CR>", { desc = "Move BufferLine to previous position" })

-- Move Lines --
-- normal mode
map("n", "<C-Down>", ":m .+1<CR>==", { desc = "Move line down" })
map("n", "<C-Up>", ":m .-2<CR>==", { desc = "Move line up" })
-- editor mode
map("i", "<C-Down>", "<Esc>:m .+1<CR>==gi", { desc = "Move line down" })
map("i", "<C-Up>", "<Esc>:m .-2<CR>==gi", { desc = "Move line up" })
-- visual mode
map("v", "<C-Down>", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
map("v", "<C-Up>", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- ---[ ^ stolen from MeteorNvim ^ ]---

-- Toggle Diagnostics Level
map("n", "<leader>uD", function()
  Diagnostics.toggle_diagnostics_level()
end, { noremap = true, silent = true, desc = "Toggle Diagnostics Level" })

-- Smart Delete (preserves clipboard while deleting empty lines) --
map("n", "dd", function()
  if vim.api.nvim_get_current_line():match "^%s*$" then
    return '"_dd'
  else
    return "dd"
  end
end, { desc = "Delete (smart)", noremap = true, expr = true })

-- ---[ LazyVim Default Keymaps ]---

-- formatting
-- unmap existing
unmap({ "n", "x" }, "<leader>cf")

map({ "n", "x" }, "<leader>cf", function()
  require("conform").format { formatters = { "injected" }, timeout_ms = 3000 }
end, { desc = "Format with Lazyformat" })

-- buffers
-- unmap existing
unmap("n", "<S-h>") -- left
unmap("n", "<S-l>") -- right
unmap("n", "<leader>bb")
unmap("n", "<leader>bd")
unmap("n", "<leader>bo")
unmap("n", "<leader>bD")

map("n", "<S-Left>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-Right>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
-- map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
-- map("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>Bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
-- map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>Bd", function()
  Snacks.bufdelete()
end, { desc = "Delete Buffer" })
map("n", "<leader>Bo", function()
  Snacks.bufdelete.other()
end, { desc = "Delete Other Buffers" })
map("n", "<leader>BD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

-- -- lazygit
-- unbind existing
unmap("n", "<leader>gL")
unmap("n", "<leader>gb")
unmap("n", "<leader>gf")
unmap("n", "<leader>gl")
unmap({ "n", "x" }, "<leader>gB")
unmap({ "n", "x" }, "<leader>gY")

-- remap
if vim.fn.executable "lazygit" == 1 then
  map("n", "<leader>Gg", function()
    ---@diagnostic disable-next-line -- ugh
    Snacks.lazygit { cwd = LazyVim.root.git() }
  end, { desc = "Lazygit (Root Dir)" })
  map("n", "<leader>GG", function()
    Snacks.lazygit()
  end, { desc = "Lazygit (cwd)" })
end

map("n", "<leader>GL", function()
  Snacks.picker.git_log()
end, { desc = "Git Log (cwd)" })
map("n", "<leader>Gb", function()
  Snacks.picker.git_log_line()
end, { desc = "Git Blame Line" })
map("n", "<leader>Gf", function()
  Snacks.picker.git_log_file()
end, { desc = "Git Current File History" })
map("n", "<leader>Gl", function()
  Snacks.picker.git_log { cwd = LazyVim.root.git() }
end, { desc = "Git Log" })
map({ "n", "x" }, "<leader>GB", function()
  Snacks.gitbrowse()
end, { desc = "Git Browse (open)" })
map({ "n", "x" }, "<leader>GY", function()
  Snacks.gitbrowse {
    open = function(url)
      vim.fn.setreg("+", url)
    end,
    notify = false,
  }
end, { desc = "Git Browse (copy)" })

-- ---[ end LazyVim Default Keymaps ]---
