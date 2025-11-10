-- /config/lazy.lua
-- https://github.com/LazyVim/starter/blob/main/lua/config/lazy.lua
---@diagnostic disable: missing-fields

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then -- remove deprecated vim.loop
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- stylua: ignore
require("lazy").setup {
  spec = {
    -- add LazyVim + LazyVim's plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },

    -- import / override default w/ nvim config
    -- { import = "utils.palettes.cat-neosolarized"},
    { import = "plugins.lazyvim" },
    { import = "plugins" },
    { import = "plugins.lsp" },         -- load LSP-related plugins
    { import = "plugins.lsp.lang" },    -- load LSPs
  },
  defaults = {
    lazy = false,
    version = false, -- always use the latest git commit
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = {
    enabled = true, -- check for plugin updates periodically
    notify = false, -- notify on update
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        -- "matchit",
        "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  profiling = {     -- Enables extra stats on the debug tab related to the loader cache.
    loader = true,  -- Additionally gathers stats about all package.loaders
    require = true, -- Track each new require in the Lazy profiling tab
  },
}
