-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- stolen from MeteorNvim

local map = vim.keymap.set


-- ...lazy/LazyVim/lua/lazyvim/plugins/extras/util/project.lua:93: module 'project_nvim' not found:
-- 	no field package.preload['project_nvim']
-- 	cache_loader: module 'project_nvim' not found
-- 	cache_loader_lib: module 'project_nvim' not found
-- 	no file './project_nvim.lua'
-- 	no file '/usr/share/luajit-2.1/project_nvim.lua'
-- 	no file '/usr/local/share/lua/5.1/project_nvim.lua'
-- 	no file '/usr/local/share/lua/5.1/project_nvim/init.lua'
-- 	no file '/usr/share/lua/5.1/project_nvim.lua'
-- 	no file '/usr/share/lua/5.1/project_nvim/init.lua'
-- 	no file '/home/lannakin/.local/share/nvim/lazy-rocks/telescope.nvim/share/lua/5.1/project_nvim.lua'
-- 	no file '/home/lannakin/.local/share/nvim/lazy-rocks/telescope.nvim/share/lua/5.1/project_nvim/init.lua'
-- 	no file './project_nvim.so'
-- 	no file '/usr/local/lib/lua/5.1/project_nvim.so'
-- 	no file '/usr/lib/lua/5.1/project_nvim.so'
-- 	no file '/usr/local/lib/lua/5.1/loadall.so'
-- 	no file '/home/lannakin/.local/share/nvim/lazy-rocks/telescope.nvim/lib/lua/5.1/project_nvim.so'
-- 	no file '/home/lannakin/.local/share/nvim/lazy-rocks/telescope.nvim/lib64/lua/5.1/project_nvim.so'

-- # stacktrace:
--   - /LazyVim/lua/lazyvim/plugins/extras/util/project.lua:93 _in_ **config**

-- Load clipboard functions
require("utils.clipboard")

-- map('n', '<C-B>', ":Neotree filesystem toggle<CR>", { desc = "Toggle Nvim Tree pane" })
-- map("n", "<C-B>", "<CMD>:NvimTreeToggle<CR>", { desc = "Toggle Nvim Tree pane" })
-- map("i", "<C-B>", "<CMD>:NvimTreeToggle<CR>", { desc = "Toggle Nvim Tree pane" })

-- Theme switcher
-- map('n', '<Leader>t', ':Telescope theme_switcher<CR>', {noremap = true, silent = true})

-- Hover
map("n", "<Leader>h", ":lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })

-- Signature Help
map("n", "<Leader>s", ":lua vim.lsp.buf.signature_help()<CR>", { noremap = true, silent = true })
map("n", "<Leader>l", ":noh<CR>", { noremap = true, silent = true })

-- Neoformat
map("n", "<Leader>f", ":lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true })

-- Renamer
map("n", "<Leader>r", ":lua require('renamer').rename()<CR>", { noremap = true, silent = true })

-- Code actions
map( "n", "<Leader>c", ":lua require('telescope').extensions.code_actions.code_actions()<CR>", { noremap = true, silent = true })

map( "n", "<Leader>gg", ":goto<CR>" )

-- Ctrl+Delete
map("i", "<C-BS>", "<C-w>")
map("i", "<C-h>", "<C-w>")

-- Splits
map("n", "<leader>sv", ":vsp<CR>", { noremap = true })
map("n", "<leader>sh", ":sp<CR>", { noremap = true })

-- Clipboard Copy
map("v", "<C-C>", "y:lua ClipboardYank()<cr>gv", { silent = true })
map("n", "<C-C>", "yy:lua ClipboardYank()<cr>", { silent = true })
map("i", "<C-C>", "<c-o>yy<c-o>:lua ClipboardYank()<cr>", { silent = true })

-- Clipboard Cut
map("v", "<C-X>", "x:lua ClipboardYank()<cr>", { silent = true })
map("n", "<C-X>", "dd:lua ClipboardYank()<cr>", { silent = true })
map("i", "<C-X>", "<c-o>dd<c-o>:lua ClipboardYank()<cr>", { silent = true })

-- Clipboard Paste
map("", "<C-V>", ":lua ClipboardPaste()<cr>p", { silent = true })
map("c", "<C-V>", "<C-R>+")
vim.cmd("exe 'inoremap <script> <C-V>' paste#paste_cmd['i']")
vim.cmd("exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']")

-- Undo
map("n", "<C-Z>", ":u<CR>")
map("i", "<C-Z>", "<c-o>:u<CR>")
map("v", "<C-Z>", "<ESC> :u<CR>")

-- Redo
map("n", "<C-Y>", ":redo<CR>")
map("i", "<C-Y>", "<c-o>:redo<CR>")
map("v", "<C-Y>", "<ESC> :redo<CR>")

-- Ctrl+Delete
map("i", "<C-BS>", "<C-w>")
map("i", "<C-h>", "<C-w>")

-- Select all
map("n", "<C-A>", "ggVG", { silent = true })
map("i", "<C-A>", "<c-o>gg<c-o>VG<cr>", { silent = true })

-- Save
map("n", "<C-S>", [[:retab | :w!<CR>]])
map("i", "<C-S>", [[<c-o>:retab | :w!<CR>]])

-- Move Selection
map("v", "<TAB>", ">gv")
map("v", "<S-TAB>", "<gv")

-- Delete in election mode
map("v", "<BS>", [["_d]])

-- Delete without save in the clipboard
map("n", "<C-K>", [["_dd]])
map("i", "<C-K>", [[<c-o>"_dd]])
map("v", "<C-K>", [["_d]])

-- Bufferline next/prev
map("n", "<C-PageDown>", ":BufferLineCycleNext<CR>")
map("i", "<C-PageDown>", "<c-o>:BufferLineCycleNext<CR>")

map("n", "<C-PageUp>", ":BufferLineCyclePrev<CR>")
map("i", "<C-PageUp>", "<c-o>:BufferLineCyclePrev<CR>")

-- Bufferline move tab
map("n", "<C-ScrollWheelUp>", ":BufferLineMoveNext<CR>")
map("i", "<C-ScrollWheelUp>", "<c-o>:BufferLineMoveNext<CR>")

map("n", "<C-ScrollWheelDown>", ":BufferLineMovePrev<CR>")
map("i", "<C-ScrollWheelDown>", "<c-o>:BufferLineMovePrev<CR>")

-- Move lines
map("n", "<C-Down>", ":m .+1<CR>==")
map("n", "<C-Up>", ":m .-2<CR>==")

map("i", "<C-Down>", "<Esc>:m .+1<CR>==gi")
map("i", "<C-Up>", "<Esc>:m .-2<CR>==gi")

map("v", "<C-Down>", ":m '>+1<CR>gv=gv")
map("v", "<C-Up>", ":m '<-2<CR>gv=gv")

-- Commenter (alacritty - gnome-terminal)
-- map("n", "<C-_>", ":CommentToggle<CR>")
-- map("i", "<C-_>", "<c-o>:CommentToggle<CR>")
-- map("v", "<C-_>", ":'<,'>CommentToggle<CR>")

-- Commenter (kitty - xterm)
map("n", "<C-7>", ":CommentToggle<CR>")
map("i", "<C-7>", "<c-o>:CommentToggle<CR>")
map("v", "<C-7>", ":'<,'>CommentToggle<CR>")

