-- /config/keymaps.lua
-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- stolen from MeteorNvim

local map = vim.keymap.set

-- Load clipboard functions --
require("utils.clipboard")

-- File tree toggle --
  -- NvimTree
-- map('n', '<C-B>', ":NvimTree filesystem toggle<CR>", { desc = "Toggle Nvim Tree pane" })
-- map("n", "<C-B>", "<CMD>:NvimTreeToggle<CR>", { desc = "Toggle Nvim Tree pane" })
-- map("i", "<C-B>", "<CMD>:NvimTreeToggle<CR>", { desc = "Toggle Nvim Tree pane" })
  -- Neotree
-- map('n', '<C-B>', ":Neotree filesystem toggle<CR>", { desc = "Toggle Nvim Tree pane" })
map("n", "<C-B>", "<CMD>:Neotree toggle<CR>", { desc = "Toggle Nvim Tree pane" })
map("i", "<C-B>", "<CMD>:Neotree toggle<CR>", { desc = "Toggle Nvim Tree pane" })

-- Theme switcher --
map('n', '<Leader>t', ':Telescope themes<CR>', {noremap = true, silent = true, desc = "Theme Switcher"})

-- Hover --
map("n", "<Leader>h", ":lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })

-- Signature Help --
map("n", "<Leader>s", ":lua vim.lsp.buf.signature_help()<CR>", { noremap = true, silent = true })
map("n", "<Leader>l", ":noh<CR>", { noremap = true, silent = true })

-- Neoformat --
map("n", "<Leader>f", ":lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true })

-- Renamer --
map("n", "<Leader>r", ":lua require('renamer').rename()<CR>", { noremap = true, silent = true })

-- Code actions --
map( "n", "<Leader>c", ":lua require('telescope').extensions.code_actions.code_actions()<CR>", { noremap = true, silent = true })

map( "n", "<Leader>gg", ":goto<CR>" )

-- Ctrl+Delete --
map("i", "<C-BS>", "<C-w>")
map("i", "<C-h>", "<C-w>")

-- Splits --
map("n", "<leader>sv", ":vsp<CR>", { noremap = true })
map("n", "<leader>sh", ":sp<CR>", { noremap = true })

-- Clipboard Copy --
map("v", "<C-C>", "y:lua ClipboardYank()<cr>gv", { silent = true })
map("n", "<C-C>", "yy:lua ClipboardYank()<cr>", { silent = true })
map("i", "<C-C>", "<c-o>yy<c-o>:lua ClipboardYank()<cr>", { silent = true })

-- Clipboard Cut --
map("v", "<C-X>", "x:lua ClipboardYank()<cr>", { silent = true })
map("n", "<C-X>", "dd:lua ClipboardYank()<cr>", { silent = true })
map("i", "<C-X>", "<c-o>dd<c-o>:lua ClipboardYank()<cr>", { silent = true })

-- Clipboard Paste --
map("", "<C-V>", ":lua ClipboardPaste()<cr>p", { silent = true })
map("c", "<C-V>", "<C-R>+")
vim.cmd("exe 'inoremap <script> <C-V>' paste#paste_cmd['i']")
vim.cmd("exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']")

-- Undo --
map("n", "<C-Z>", ":u<CR>")
map("i", "<C-Z>", "<c-o>:u<CR>")
map("v", "<C-Z>", "<ESC> :u<CR>")

-- Redo --
map("n", "<C-Y>", ":redo<CR>")
map("i", "<C-Y>", "<c-o>:redo<CR>")
map("v", "<C-Y>", "<ESC> :redo<CR>")

-- Ctrl+Delete --
map("i", "<C-BS>", "<C-w>")
map("i", "<C-h>", "<C-w>")

-- Select all --
map("n", "<C-A>", "ggVG", { silent = true })
map("i", "<C-A>", "<c-o>gg<c-o>VG<cr>", { silent = true })

-- Save --
map("n", "<C-S>", [[:retab | :w!<CR>]])
map("i", "<C-S>", [[<c-o>:retab | :w!<CR>]])

-- Move Selection --
map("v", "<TAB>", ">gv")
map("v", "<S-TAB>", "<gv")

-- Delete in election mode --
map("v", "<BS>", [["_d]])

-- Delete without save in the clipboard --
map("n", "<C-K>", [["_dd]])
map("i", "<C-K>", [[<c-o>"_dd]])
map("v", "<C-K>", [["_d]])

-- Bufferline next/prev --
  -- next
map("n", "<C-PageDown>", ":BufferLineCycleNext<CR>")
map("i", "<C-PageDown>", "<c-o>:BufferLineCycleNext<CR>")
  -- prev
map("n", "<C-PageUp>", ":BufferLineCyclePrev<CR>")
map("i", "<C-PageUp>", "<c-o>:BufferLineCyclePrev<CR>")

-- Bufferline move tab --
  -- next
map("n", "<C-ScrollWheelUp>", ":BufferLineMoveNext<CR>")
map("i", "<C-ScrollWheelUp>", "<c-o>:BufferLineMoveNext<CR>")
  -- prev
map("n", "<C-ScrollWheelDown>", ":BufferLineMovePrev<CR>")
map("i", "<C-ScrollWheelDown>", "<c-o>:BufferLineMovePrev<CR>")

-- Move lines --
  -- normal mode
map("n", "<C-Down>", ":m .+1<CR>==")
map("n", "<C-Up>", ":m .-2<CR>==")
  -- editor mode
map("i", "<C-Down>", "<Esc>:m .+1<CR>==gi")
map("i", "<C-Up>", "<Esc>:m .-2<CR>==gi")
  -- visual mode
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

--[[  -- LazyVim Default Keymaps --
-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Move Lines
map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>bd", function()
  Snacks.bufdelete()
end, { desc = "Delete Buffer" })
map("n", "<leader>bo", function()
  Snacks.bufdelete.other()
end, { desc = "Delete Other Buffers" })
map("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

-- Clear search and stop snippet on escape
map({ "i", "n", "s" }, "<esc>", function()
  vim.cmd("noh")
  LazyVim.cmp.actions.snippet_stop()
  return "<esc>"
end, { expr = true, desc = "Escape and Clear hlsearch" })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
map(
  "n",
  "<leader>ur",
  "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
  { desc = "Redraw / Clear hlsearch / Diff Update" }
)

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

--keywordprg
map("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- commenting
map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

-- lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- new file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- location list
map("n", "<leader>xl", function()
  local success, err = pcall(vim.fn.getloclist(0, { winid = 0 }).winid ~= 0 and vim.cmd.lclose or vim.cmd.lopen)
  if not success and err then
    vim.notify(err, vim.log.levels.ERROR)
  end
end, { desc = "Location List" })

-- quickfix list
map("n", "<leader>xq", function()
  local success, err = pcall(vim.fn.getqflist({ winid = 0 }).winid ~= 0 and vim.cmd.cclose or vim.cmd.copen)
  if not success and err then
    vim.notify(err, vim.log.levels.ERROR)
  end
end, { desc = "Quickfix List" })

map("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
map("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })

-- formatting
map({ "n", "v" }, "<leader>cf", function()
  LazyVim.format({ force = true })
end, { desc = "Format" })

-- diagnostic
local diagnostic_goto = function(next, severity)
  return function()
    vim.diagnostic.jump({
      count = (next and 1 or -1) * vim.v.count1,
      severity = severity and vim.diagnostic.severity[severity] or nil,
      float = true,
    })
  end
end
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- stylua: ignore start

-- toggle options
LazyVim.format.snacks_toggle():map("<leader>uf")
LazyVim.format.snacks_toggle(true):map("<leader>uF")
Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
Snacks.toggle.diagnostics():map("<leader>ud")
Snacks.toggle.line_number():map("<leader>ul")
Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2, name = "Conceal Level" }):map("<leader>uc")
Snacks.toggle.option("showtabline", { off = 0, on = vim.o.showtabline > 0 and vim.o.showtabline or 2, name = "Tabline" }):map("<leader>uA")
Snacks.toggle.treesitter():map("<leader>uT")
Snacks.toggle.option("background", { off = "light", on = "dark" , name = "Dark Background" }):map("<leader>ub")
Snacks.toggle.dim():map("<leader>uD")
Snacks.toggle.animate():map("<leader>ua")
Snacks.toggle.indent():map("<leader>ug")
Snacks.toggle.scroll():map("<leader>uS")
Snacks.toggle.profiler():map("<leader>dpp")
Snacks.toggle.profiler_highlights():map("<leader>dph")

if vim.lsp.inlay_hint then
  Snacks.toggle.inlay_hints():map("<leader>uh")
end

-- lazygit
if vim.fn.executable("lazygit") == 1 then
  map("n", "<leader>gg", function() Snacks.lazygit( { cwd = LazyVim.root.git() }) end, { desc = "Lazygit (Root Dir)" })
  map("n", "<leader>gG", function() Snacks.lazygit() end, { desc = "Lazygit (cwd)" })
end

map("n", "<leader>gL", function() Snacks.picker.git_log() end, { desc = "Git Log (cwd)" })
map("n", "<leader>gb", function() Snacks.picker.git_log_line() end, { desc = "Git Blame Line" })
map("n", "<leader>gf", function() Snacks.picker.git_log_file() end, { desc = "Git Current File History" })
map("n", "<leader>gl", function() Snacks.picker.git_log({ cwd = LazyVim.root.git() }) end, { desc = "Git Log" })
map({ "n", "x" }, "<leader>gB", function() Snacks.gitbrowse() end, { desc = "Git Browse (open)" })
map({"n", "x" }, "<leader>gY", function()
  Snacks.gitbrowse({ open = function(url) vim.fn.setreg("+", url) end, notify = false })
end, { desc = "Git Browse (copy)" })

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- highlights under cursor
map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
map("n", "<leader>uI", function() vim.treesitter.inspect_tree() vim.api.nvim_input("I") end, { desc = "Inspect Tree" })

-- LazyVim Changelog
map("n", "<leader>L", function() LazyVim.news.changelog() end, { desc = "LazyVim Changelog" })

-- floating terminal
map("n", "<leader>fT", function() Snacks.terminal() end, { desc = "Terminal (cwd)" })
map("n", "<leader>ft", function() Snacks.terminal(nil, { cwd = LazyVim.root() }) end, { desc = "Terminal (Root Dir)" })
map({"n","t"}, "<c-/>",function() Snacks.terminal(nil, { cwd = LazyVim.root() }) end, { desc = "Terminal (Root Dir)" })
map({"n","t"}, "<c-_>",function() Snacks.terminal(nil, { cwd = LazyVim.root() }) end, { desc = "which_key_ignore" })

-- windows
map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })
Snacks.toggle.zoom():map("<leader>wm"):map("<leader>uZ")
Snacks.toggle.zen():map("<leader>uz")

-- tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
--]] -- end LazyVim Default Keymaps --
