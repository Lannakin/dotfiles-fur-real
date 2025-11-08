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

-- --| seriously, stop autoformatting |--------------------------------------------------------------------------------
-- vim.api.nvim_clear_autocmds({ group = "lsp_auto_format", event = "BufWritePre" })

-- --| tab expansion on save |------------------------------------------------------
-- src: fucking google ai overview so i hope it's fucking wrong.
local expand_tabs_augroup = augroup("ExpandTabsOnSave", { clear = true })

-- Add an autocmd that triggers before a buffer is written
-- stylua: ignore
autocmd("BufWritePre", {
  group = expand_tabs_augroup,
  callback = function()
    -- Temporarily set 'expandtab' and then run 'retab!' for the current buffer
    vim.cmd [[setlocal expandtab]]  -- Enable expandtab for this buffer
    vim.cmd [[%retab!]]             -- Convert all tabs to spaces according to current settings
  end,
  desc = "Expand tabs to spaces before saving",
})

-- --| set syntax/filetype to jsonc |----------------------------------------------------------------------------------
-- src: another google ai overview special
autocmd({ "BufNewFile", "BufRead" }, {
  group = augroup("JsoncSyntax", { clear = true }),
  pattern = { "*.jsonc", "*.cjson", "*.cjsn", "appsettings*.json" },
  callback = function()
    vim.opt.filetype = "json"
  end,
  desc = "Set filetype to json for jsonc files within a specific group",
})

-- --| Automatically open Trouble Quickfix |---------------------------------------------------------------------------
autocmd("QuickFixCmdPost", {
  callback = function()
    vim.cmd [[Trouble qflist open]]
  end,
})

-- --| Open plugin repos with gx |-------------------------------------------------------------------------------------
-- src: https://github.com/dpetka2001/dotfiles/blob/main/dot_config/nvim/lua/config/autocmds.lua
autocmd("BufReadPost", {
  group = augroup("GxWithPlugins", { clear = true }),
  callback = function()
    if vim.fn.getcwd() == vim.fn.stdpath "config" then
      map("n", "gx", function()
        local file = vim.fn.expand "<cfile>" --[[@as string]]

        -- First try default behavior
        -- see https://github.com/neovim/neovim/blob/b0f9228179bf781eec76d1aaf346b56a7e64cd5d/runtime/lua/vim/_defaults.lua#L101
        -- current 2025-11-05: https://github.com/neovim/neovim/blob/master/runtime/lua/vim/_defaults.lua#L140
        local cmd, err = vim.ui.open(file)
        local rv = cmd and cmd:wait(1000) or nil
        if cmd and rv and rv.code ~= 0 then
          err = ("vim.ui.open: command %s (%d): %s"):format(
            (rv.code == 124 and "timeout" or "failed"),
            rv.code,
            vim.inspect(cmd.cmd)
          )
        end
        if not err then
          return
        end

        -- Consider anything that looks like string/string a GitHub link.
        local link = file:match "%w[%w%-]+/[%w%-%._]+"
        if link then
          vim.ui.open("https://www.github.com/" .. link)
          err = nil
        end

        -- Else show the error
        if err then
          vim.notify(err, vim.log.levels.ERROR)
        end
      end, { desc = "Open filepath or URI under cursor" })
    end
  end,
  desc = "Make `gx` open repos in default browser",
})

-- --| User command for diffing current buffer when not in .git repo |-------------------------------------------------
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
  vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = scratch_buffer, silent = true })
end, { desc = "Diff current buffer not .git" })

-- --| AUTOMATICALLY SET COLORCOLUMN BASED ON FILETYPE |---------------------------------------------------------------
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
      return
    end                                        -- exit early if no column
    vim.o.colorcolumn = target_ccolumn -- else set column
  end,
})
