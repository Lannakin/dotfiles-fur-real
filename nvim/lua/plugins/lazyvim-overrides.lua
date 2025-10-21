-- /plugins/lazyvim-overrides.lua
-- disabled if below line is active
-- if true then return {} end

-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  {
    "ahmedkhalf/project.nvim",
    dependencies = { "DrKJeff16/project.nvim" },
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- bigfile = { enabled = true },
      dashboard = { enabled = false },
      explorer = { enabled = false }, --edit
      -- indent = { enabled = true },
      -- input = { enabled = true },
      -- notifier = { enabled = true },
      -- quickfile = { enabled = true },
      -- scope = { enabled = true },
      -- scroll = { enabled = true },
      -- statuscolumn = { enabled = true },
      -- words = { enabled = true },
      -- picker = { enabled = false, },
      -- picker = { enabled = false, border = "single" },
      scratch = { border = "single" },
      snacks_image = { border = "single" },
    },
  },
}
