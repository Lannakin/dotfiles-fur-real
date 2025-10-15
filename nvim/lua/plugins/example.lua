-- if true then return {} end
-- stylua: ignore

-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins

-- #================# --
-- #  BEGIN RETURN  # --
-- #================# --

return {
  -- add gruvbox
  -- { "ellisonleao/gruvbox.nvim" },

  -- -- Configure LazyVim to load gruvbox
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "gruvbox",
  --   },
  -- },

  -- change trouble config
  -- {
  --   "folke/trouble.nvim",
  --   -- opts will be merged with the parent spec
  --   opts = { use_diagnostic_signs = true },
  -- },

  -- disable
  -- { "folke/snacks.nvim", enabled = false },

  -- override nvim-cmp and add cmp-emoji
  -- {
  --   "ahmedkhalf/project.nvim",
  --   dependencies = { "DrKJeff16/project.nvim" },
  --   -- ---@param opts cmp.ConfigSchema
  --   -- opts = function(_, opts)
  --   --   table.insert(opts.sources, { name = "emoji" })
  --   -- end,
  -- },

  {
    "folke/noice.nvim",
    views = {
      cmdline_popup = {
        border = { style = "single" },
        position = {
          row = 5,
          col = "50%",
        },
        size = {
          width = 60,
          height = "auto",
        },
      },
      popupmenu = {
        relative = "editor",
        position = {
          row = 8,
          col = "50%",
        },
        size = {
          width = 60,
          height = 10,
        },
        border = {
          style = "single",
          padding = { 0, 1 },
        },
        win_options = {
          winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
        },
      },
    },
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
      -- dashboard = { enabled = true },
      -- explorer = { enabled = false }, --edit
      -- indent = { enabled = true },
      -- input = { enabled = true },
      -- notifier = { enabled = true },
      -- quickfile = { enabled = true },
      -- scope = { enabled = true },
      -- scroll = { enabled = true },
      -- statuscolumn = { enabled = true },
      -- words = { enabled = true },
      -- picker = { enabled = true, },
      -- picker = { border = "single" },
      scratch = { border = "single" },
      -- snacks_image = { border = "single" },
    },
  },
}
