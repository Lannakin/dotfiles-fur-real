-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- src: https://github.com/dpetka2001/dotfiles/blob/main/dot_config/nvim/lua/config/autocmds.lua
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local usercmd = vim.api.nvim_create_user_command

local map = vim.api.nvim_buf_set_keymap

--[[ v OLD ENTRIES v ]]--
-- Disable autoformat for lua files
--[[
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "lua" },
  callback = function()
    vim.b.autoformat = false
  end,
})
--]]
--[[ ^ OLD ENTRIES ^ ]]--

--[[ Open plugin repos with gx ]]
autocmd("BufReadPost", { -- prefer local alias variable autocmd
  group = augroup("GxWithPlugins", { clear = true }), -- prefer local alias variable augroup
  callback = function()
    if vim.fn.getcwd() == vim.fn.stdpath("config") then
      vim.keymap.set("n", "gx", function()
        local file = vim.fn.expand("<cfile>") --[[@as string]]

        -- First try the default behavior
        -- see https://github.com/neovim/neovim/blob/b0f9228179bf781eec76d1aaf346b56a7e64cd5d/runtime/lua/vim/_defaults.lua#L101
        -- for recent changes in `vim.ui.open`
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
        local link = file:match("%w[%w%-]+/[%w%-%._]+")
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
