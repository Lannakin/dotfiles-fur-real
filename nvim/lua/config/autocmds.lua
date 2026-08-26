-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`

-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local usercmd = vim.api.nvim_create_user_command

local map = vim.keymap.set

-- --| Disable autoformat for lua files |------------------------------------------------------------------------------
autocmd({ "FileType" }, {
  pattern = { "lua" },
  callback = function()
    vim.b.autoformat = false
  end,
})

--| Create a dir when saving a file if it doesnt exist |---------------------------------------------------------------
-- src: https://github.com/Matt-FTW/dotfiles/blob/main/.config/nvim/lua/config/autocmds.lua
autocmd("BufWritePre", {
  group = augroup("auto_create_dir", { clear = true }),
  callback = function(args)
    if args.match:match "^%w%w+://" then
      return
    end
    local file = vim.uv.fs_realpath(args.match) or args.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

-- --| tab expansion on save |-----------------------------------------------------------------------------------------
-- src: fucking google ai overview so i hope it's fucking wrong.

-- Add an autocmd that triggers before a buffer is written
-- stylua: ignore
autocmd("BufWritePre", {
  group = augroup("ExpandTabsOnSave", { clear = true }),
  callback = function()
    -- Temporarily set 'expandtab' and then run 'retab!' for the current buffer
    vim.cmd [[setlocal expandtab]]  -- Enable expandtab for this buffer
    vim.cmd [[%retab!]]             -- Convert all tabs to spaces according to current settings
  end,
  desc = "Expand tabs to spaces before saving",
})

-- --| set filetype to vim |-------------------------------------------------------------------------------------------
autocmd({ "BufNewFile", "BufRead" }, {
  group = augroup("VimSyntax", { clear = true }),
  pattern = { "vimpcrc" },
  callback = function()
    vim.opt.filetype = "vim"
  end,
  desc = "Set filetype to vim for certain types of config files",
})

-- --| Automatically open Trouble Quickfix |---------------------------------------------------------------------------
autocmd("QuickFixCmdPost", {
  callback = function()
    vim.cmd [[Trouble qflist open]]
  end,
})

-- --| User command for diffing current buffer when not in .git repo |-------------------------------------------------
-- src: https://github.com/dpetka2001/dotfiles/blob/main/dot_config/nvim/lua/config/autocmds.lua
-- stylua: ignore
usercmd("DiffOrig", function()
  local scratch_buffer = vim.api.nvim_create_buf(false, true)
  local current_ft = vim.bo.filetype
  vim.cmd("vertical sbuffer" .. scratch_buffer)
  vim.bo[scratch_buffer].filetype = current_ft
  vim.cmd "read ++edit #" -- load contents of previous buffer into scratch_buffer
  vim.cmd.normal '1G"_d_' -- delete extra newline at top of scratch_buffer without overriding register
  vim.cmd.diffthis()      -- scratch_buffer
  vim.cmd.wincmd "p"
  vim.cmd.diffthis()      -- current buffer
  map("n", "q", "<cmd>close<cr>", { buffer = scratch_buffer, silent = true })
end, { desc = "Diff current buffer not .git" })

-- --| automatically set colorcolumn |---------------------------------------------------------------------------------
-- src: https://github.com/hollowillow/nvim/blob/main/lua/minimal/autocmds.lua
-- ccolumn position by filetype
local ft_ccolumn = {
  text = "",
  markdown = "80",
  rust = "100",
  lua = "120",
}
-- if ccolumn is undefined for filetype use default
local default_ccolumn = "80"

augroup("DynamicCColumn", { clear = true })
-- stylua: ignore
autocmd("Filetype", {
  group = "DynamicCColumn",
  callback = function()
    -- get filetype settings
    local target_ccolumn = ft_ccolumn[vim.o.filetype] or default_ccolumn
    if target_ccolumn == "" then
      return          -- exit early if no column
    end
    vim.o.colorcolumn = target_ccolumn -- else set column
  end,
})
