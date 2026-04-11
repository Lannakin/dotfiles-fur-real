-- /plugins/lazyvim.lua
-- disabled if below line is active
-- if true then return {} end
-- location for overriding LazyVim default plugins and their options

---@type LazySpec
return {
  -- --| replacements / overrides |------------------------------------------------------------------------------------
  {
    "nvim-mini/mini.icons",
    -- enabled = false
    dependencies = { "DaikyXendo/nvim-material-icon", opts = {} },
  },
  -- https://github.com/nvim-mini/mini.ai
  { "nvim-mini/mini.ai", enabled = false },
  -- https://github.com/hrsh7th/nvim-cmp
  { "hrsh7th/nvim-cmp", enabled = false },
  { -- replace default project.nvim with actively developed fork
    -- https://github.com/ahmedkhalf/project.nvim
    "ahmedkhalf/project.nvim",
    -- https://github.com/DrKJeff16/project.nvim
    dependencies = { "DrKJeff16/project.nvim" },
    opts = {}, -- necessary for lazyvim to call setup for project.nvim
  },
  -- --| disabled |----------------------------------------------------------------------------------------------------
  { -- unused; hogs keymaps i want to use
    -- https://github.com/folke/flash.nvim
    "folke/flash.nvim",
    enabled = false,
  },
  { -- causing issues with recalling sessions at all
    -- https://github.com/folke/persistence.nvim
    "folke/persistence.nvim",
    enabled = false,
  },
  { -- switch to spectre.nvim
    -- https://github.com/MagicDuck/grug-far.nvim
    "MagicDuck/grug-far.nvim",
    enabled = false,
  },
  -- --| reconfigured |------------------------------------------------------------------------------------------------
  {
    -- https://github.com/folke/snacks.nvim
    "folke/snacks.nvim",
    priority = 1000,
    -- stylua: ignore
    opts = {
      -- animate = { enabled = true },      -- efficient animations
      -- bigfile = { enabled = true },      -- deal with big files
      -- bufdelete = { enabled = true },    -- delete buffers conveneiently
      dashboard = { enabled = false },      -- declarative dashboards
      dim = { enabled = true },             -- dim everything outside current scope
      explorer = { enabled = false },       -- file explorer (picker)
      indent = { enabled = true },          -- indent guides and scopes
      -- input = { enabled = true },        -- better vim.ui.input
      lazygit = { enabled = true },         -- open LazyGit in floating window, auto-configure color scheme w/ Neovim
      notifier = { enabled = false },       -- alternative vim.notify; NOTE: using Noice instead
      -- picker = { enabled = true, },      -- picker for selecting items
      -- quickfile = { enabled = true },    -- render file before loading plugins
      scope = { enabled = true },           -- scope detection, text objects and jumping based on treesitter or indent
      scratch = { border = "single" },      -- scratch buffers w/ a persistent file
      snacks_image = { border = "single" }, -- image viewer using Kitty Graphics Protocol
      statuscolumn = { enabled = false },
      -- scroll = { enabled = true },       -- smooth scrolling
      -- terminal = { enabled = true },     -- create/toggle floating/split terminals
      -- words = { enabled = true },        -- auto-show LSP references and navigage between them
    },
  },
  -- --| lazydev etc |-------------------------------------------------------------------------------------------------
  { -- to add luvit to emmylua_ls for lazydev
    -- https://github.com/Bilal2453/luvit-meta
    "Bilal2453/luvit-meta",
    lazy = false,
  },
  {
    -- https://github.com/folke/lazydev.nvim
    "folke/lazydev.nvim",
    ft = "lua",
    -- stylua: ignore
    opts = {
      library = { -- libraries have trigger words commented out so they stop reloading
        -- { path = "${3rd}/luv/library" },
        { path = "lazy.nvim" },
        { path = "LazyVim" },

        { path = "${LUALS_3RD}/luv/library" },
        { path = "${RUNTIMEPATH}" },

        { path = "auto-session" },
        { path = "blink.cmp" },
        { path = "bufferline.nvim" },
        { path = "esqueleto.nvim" },
        { path = "neo-tree.nvim" },
        { path = "noice.nvim" },
        { path = "nvim-platformio.lua" },
        { path = "plenary.nvim" },
        { path = "project.nvim" },
        { path = "render-markdown.nvim" },
        { path = "snacks.nvim" },
        { path = "trouble.nvim" },
        -- { path = ""--[[, words = { "" } ]] },
      },
    },
  },
}
