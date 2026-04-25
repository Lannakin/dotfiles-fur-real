-- /config/keymaps.lua
-- lazyvim defaults full src: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- stylua: ignore start
-- ================================================================================================================= --

-- --| local variables |-----------------------------------------------------------------------------------------------
local map = vim.keymap.set
local unmap = vim.keymap.del

-- +---------------------------------------------------------+
-- |                 unmap existing keymaps                  |
-- +---------------------------------------------------------+

-- --| unmap existing default neovim keymaps |-------------------------------------------------------------------------
-- [ various ] --
unmap({ "n", "x" }, "p")     -- remove text??????
-- unmap({ "n", "x" }, "S")     -- remove text??????
-- unmap({ "n", "x" }, "R")     -- remove text??????
unmap("n", "<leader>fn")     -- file operations: new file
-- unmap("n", "n")
-- unmap({ "n" }, "f") -- next item in Search
-- unmap("n", "dd") -- delete
-- [ movement ] --
unmap({ "n", "i" }, "<C-F>") -- scroll forward
unmap({ "n", "x" }, "k")     -- move up one line

-- --| unmap existing lazyvim default kemaps |-------------------------------------------------------------------------
-- [ various ] --
unmap("n", "<leader>uD")          -- toggle dimming
unmap({ "n", "x" }, "<leader>cf") -- format file
unmap("n", "<leader>K")
-- [ buffer operations ] --
unmap("n", "<S-h>")      -- prev buffer
unmap("n", "<S-l>")      -- next buffer
unmap("n", "<C-Up>")     -- resize buffer up
unmap("n", "<C-Down>")   -- resize buffer down
unmap("n", "<C-Left>")   -- resize buffer left
unmap("n", "<C-Right>")  -- resize buffer right
unmap("n", "<leader>bb") -- switch to other buffer
unmap("n", "<leader>bd") -- delete buffer
unmap("n", "<leader>bo") -- delete other buffers
unmap("n", "<leader>bD") -- delete buffer and window
-- [ find ] --
unmap("n", "<leader>ff") -- find file in Root dir
unmap("n", "<leader>fF") -- find file in cwd
unmap("n", "<leader>fg") -- find file in git
unmap("n", "<leader>fr") -- find recent file
unmap("n", "<leader>fR") -- find revent file in root
unmap("n", "<leader>fc") -- find config file
-- [ open terminal ] --
unmap("n", "<leader>ft") -- open terminal in root dir
unmap("n", "<leader>fT") -- open terminal in cwd
-- unmap({ "n", "x" }, "") -- 

-- --| unmap using <Nop> |---------------------------------------------------------------------------------------------
-- [ commands ] --
map({ "n", "x", "o" }, "f", "<Nop>") -- search char next
map({ "n", "x", "o" }, "F", "<Nop>") -- search char previous
map({ "n", "x", "o" }, "s", "<Nop>") -- substitution next
map({ "n", "x", "o" }, "S", "<Nop>") -- substitution previous
map("n", "cc", "<Nop>", { silent = true }) -- change line
map("n", "Cc", "<Nop>", { silent = true }) -- delete line?
map("n", "CC", "<Nop>", { silent = true }) -- delete line after cursor
-- map({ "n", "x", "o" }, "", "<Nop>") -- 

-- +---------------------------------------------------------+
-- |                     file operations                     |
-- +---------------------------------------------------------+

-- --| renamer |-------------------------------------------------------------------------------------------------------
map("n", "<Leader>r", ":lua require('renamer').rename()<CR>", { desc = "Rename file with renamer", noremap = true, silent = true })

-- +---------------------------------------------------------+
-- |                   editor operations                     |
-- +---------------------------------------------------------+

-- --| select all |----------------------------------------------------------------------------------------------------
map("n", "<C-A>", "ggVG", { desc = "Select all", noremap = true, silent = true })
map("i", "<C-A>", "<c-o>gg<c-o>VG<cr>", { desc = "Select all", noremap = true, silent = true })

-- --| undo / redo operations |----------------------------------------------------------------------------------------
-- [ undo ] --
map("n", "<C-Z>", ":u<CR>", { desc = "Undo" })
map("i", "<C-Z>", "<c-o>:u<CR>", { desc = "Undo" })
map("v", "<C-Z>", "<ESC>:u<CR>", { desc = "Undo" })
-- [ add undo break-points ] --
-- src: https://tduyng.com/blog/neovim-basic-setup/
map("i", ",", ",<c-g>u" )
map("i", ".", ".<c-g>u" )
map("i", ";", ";<c-g>u" )

-- [ redo ] --
map("n", "<C-Y>", ":redo<CR>", { desc = "Redo" })
map("i", "<C-Y>", "<c-o>:redo<CR>", { desc = "Redo" })
map("v", "<C-Y>", "<ESC> :redo<CR>", { desc = "Redo" })

-- --| indent selection |----------------------------------------------------------------------------------------------
map("v", "<TAB>", ">gv", { desc = "Indent selection right" })
map("v", "<S-TAB>", "<gv", { desc = "Indent selection left" })

-- --| move line |-----------------------------------------------------------------------------------------------------
-- [ up ] --
map("i", "<C-Up>", "<Esc>:m .-2<CR>==gi", { desc = "Move line up" })
map("n", "<C-Up>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move line up" })
map("v", "<C-Up>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move line up" })
-- map("n", "<C-Up>", ":m .-2<CR>==", { desc = "Move line up" })
-- map("v", "<C-Up>", ":m '<-2<CR>gv=gv", { desc = "Move line up" })
-- [ down ] --
map("i", "<C-Down>", "<Esc>:m .+1<CR>==gi", { desc = "Move line down" })
map("n", "<C-Down>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move line down" })
map("v", "<C-Down>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move line down" })
-- map("n", "<C-Down>", ":m .+1<CR>==", { desc = "Move line down" })
-- map("v", "<C-Down>", ":m '>+1<CR>gv=gv", { desc = "Move line down" })

-- --| clipboard Functions |-------------------------------------------------------------------------------------------
-- [ clipboard cut ] --
map({ "i", "n", "v" }, "<C-X>", '"+d', { desc = "Cut to system clipboard", silent = true })

-- [ clipboard copy ] --
map({ "i", "n", "v" }, "<C-C>", '"+y', { desc = "Copy to system clipboard", silent = true })

-- [clipboard paste ] --
map({ "i", "n", "v" }, "<C-V>", '"+p', { desc = "Paste from system clipboard", silent = true })
map({ "v",  "x" }, "<C-V>", function() return 'pgv"' .. vim.v.register .. "y" end, { desc = "Paste without deleting clipboard contents", noremap = true, silent = true, expr = true })

-- --| delete operations |---------------------------------------------------------------------------------------------
-- [ delete selection ] --
map("v", "<BS>", [["_d]], { desc = "Delete selection" })

-- [ clipboard-safe deletion ] --
map("n", "<C-K>", [["_dd]], { desc = "Clipboard-safe delete" })
map("i", "<C-K>", [[<c-o>"_dd]], { desc = "Clipboard-safe delete" })
map("v", "<C-K>", [["_d]], { desc = "Clipboard-safe delete" })

-- [ control-delete ] --
map("i", "<C-BS>", "<C-w>", { desc = "Control Delete" })
map("i", "<C-h>", "<C-w>", { desc = "Control Delete" })
map("i", "<C-BS>", "<C-w>", { desc = "Delete next word" })
map("i", "<C-h>", "<C-w>", { desc = "Delete next word" })

-- [ smart delete (preserves clipboard while deleting empty lines) ] --
--[[map("n", "dd", function()
  if vim.api.nvim_get_current_line():match "^%s*$" then
    return '"_dd'
  else
    return "dd"
  end
end, { desc = "Delete (smart)", noremap = true, expr = true })
--]]

-- --| formatting |----------------------------------------------------------------------------------------------------
-- [ lazyformat ] --
map({ "n", "x" }, "<leader>cf", ":LazyFormat<CR>", { desc = "Format with Lazyformat" })

-- --| auto-pairing |---------------------------------------------------------------------------------------------------
map("i", "`", "``<left>", { desc = "Auto-pair ` `" })
map("i", '"', '""<left>', { desc = 'Auto-pair " "' })
map("i", "(", "()<left>", { desc = "Auto-pair ( )" })
map("i", "[", "[]<left>", { desc = "Auto-pair [ ]" })
map("i", "{", "{}<left>", { desc = "Auto-pair { }" })
map("i", "<", "<><left>", { desc = "Auto-pair < >" })

-- --| search |--------------------------------------------------------------------------------------------------------
-- [ next search result ] --
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search Result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search Result" })
-- [ prev search result ] --
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search Result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search Result" })

-- +---------------------------------------------------------+
-- |             buffer navigation & management              |
-- +---------------------------------------------------------+

-- --| bufferline buffer navigation |----------------------------------------------------------------------------------
-- [ cycle next / prev ] --
map("i", "<C-PageDown>", "<c-o>:BufferLineCycleNext<CR>", { desc = "Cycle to next buffer in BufferLine" })
map("n", "<C-PageDown>", ":BufferLineCycleNext<CR>", { desc = "Cycle to next buffer in BufferLine" })
map("i", "<C-PageUp>", "<c-o>:BufferLineCyclePrev<CR>", { desc = "Cycle to previous buffer in BufferLine" })
map("n", "<C-PageUp>", ":BufferLineCyclePrev<CR>", { desc = "Cycle to previous buffer in BufferLine" })

-- --| bufferline move tab |-------------------------------------------------------------------------------------------
-- [ next / prev position ] --
map("i", "<C-ScrollWheelUp>", "<c-o>:BufferLineMoveNext<CR>", { desc = "Move BufferLine to next position" })
map("n", "<C-ScrollWheelUp>", ":BufferLineMoveNext<CR>", { desc = "Move BufferLine to next position" })
map("i", "<C-ScrollWheelDown>", "<c-o>:BufferLineMovePrev<CR>", { desc = "Move BufferLine to previous position" })
map("n", "<C-ScrollWheelDown>", ":BufferLineMovePrev<CR>", { desc = "Move BufferLine to previous position" })

-- --| buffer navigation |---------------------------------------------------------------------------------------------
-- [ cycle next / prev ] --
map("n", "<S-Right>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<S-Left>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })

-- [ switch ] --
map("n", "<leader>Bb", "<cmd>e #<cr>", { desc = "Switch to other buffer" })

-- [ delete (close) ] --
---@diagnostic disable: undefined-global
map("n", "<leader>Bd", function() Snacks.bufdelete() end, { desc = "Close buffer" })
map("n", "<leader>Bo", function() Snacks.bufdelete.other() end, { desc = "Close other buffers" })
map("n", "<leader>BD", "<cmd>:bd<cr>", { desc = "Close buffer and window" })
---@diagnostic enable

-- +---------------------------------------------------------+
-- |              tab nagivation & management                |
-- +---------------------------------------------------------+

-- --| tab navigation |------------------------------------------------------------------------------------------------
-- [ prev / next ] --
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab><right>", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
map("n", "<leader><tab><left>", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
-- [ first / last ] --
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })

-- --| tab management |------------------------------------------------------------------------------------------------
-- [ new tab ] --
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
-- [ close tabs ] --
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })

-- --| neotree |-------------------------------------------------------------------------------------------------------
map({ "i", "n" }, "<C-F>", "<CMD>:Neotree toggle<CR>", { desc = "Toggle Neotree pane" })

-- +---------------------------------------------------------+
-- |           coding and development operations             |
-- +---------------------------------------------------------+

-- --| code actions |--------------------------------------------------------------------------------------------------
map("n", "<Leader>ca", ":lua require('telescope').extensions.code_actions.code_actions()<CR>", { desc = "Code actions", noremap = true, silent = true })
-- map("n", "<Leader>gg", ":goto<CR>", { desc = "Code actions: go to" })

-- --| -keyword program (K for help on word under cursor) |------------------------------------------------------------
map("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })

-- --| inspect ui |----------------------------------------------------------------------------------------------------
map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
map("n", "<leader>uI", "<cmd>InspectTree<cr>", { desc = "Inspect Tree" })

-- --| LSP operations |------------------------------------------------------------------------------------------------
-- [ hover ] --
map("n", "<Leader>h", ":lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })

-- [ signature help ] --
-- map("n", "<Leader>ls", ":lua vim.lsp.buf.signature_help()<CR>", { desc = "LSP signature help", noremap = true, silent = true })
-- map("n", "<Leader>l", ":noh<CR>", { desc = "LSP signature help", noremap = true, silent = true })

-- +---------------------------------------------------------+
-- |            search operations and navigation             |
-- +---------------------------------------------------------+

-- --| search navigation |---------------------------------------------------------------------------------------------
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })

-- --| search current word in browser |--------------------------------------------------------------------------------
-- src: https://github.com/Matt-FTW/dotfiles/blob/main/.config/nvim/lua/config/keymaps.lua
local searching_brave = function()
  vim.fn.system({ "xdg-open", "https://search.brave.com/search?q=" .. vim.fn.expand("<cword>") })
end
map("n", "<leader>?", searching_brave, { noremap = true, silent = true, desc = "Search Current Word on Brave Search" })

-- +---------------------------------------------------------+
-- |                  utility operations                     |
-- +---------------------------------------------------------+

-- --| reload neovim |-------------------------------------------------------------------------------------------------
-- FIXME: "needs at least one plugin"
-- map("n", "<C-R>", "<CMD>:Lazy reload<CR>", { desc = "Reload Neovim configurations using Lazy" } )

-- ================================================================================================================= --
-- stylua: ignore end
