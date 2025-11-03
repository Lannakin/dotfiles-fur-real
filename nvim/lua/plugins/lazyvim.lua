-- /plugins/lazyvim.lua
-- disabled if below line is active
-- if true then return {} end
-- location for overriding LazyVim default plugins and their options

return {
    -- https://github.com/hrsh7th/nvim-cmp
  { "hrsh7th/nvim-cmp", enabled=false },
  { -- replace default project.nvim with actively developed fork
    -- https://github.com/ahmedkhalf/project.nvim
    "ahmedkhalf/project.nvim",
    -- https://github.com/DrKJeff16/project.nvim
    dependencies = { "DrKJeff16/project.nvim" },
    opts = {},  -- necessary for lazyvim to call setup for project.nvim
  },
  {
    -- https://github.com/folke/flash.nvim
    "folke/flash.nvim",
    enabled = false,
  },
  {
    -- https://github.com/folke/snacks.nvim
    "folke/snacks.nvim",
    priority = 1000,
    opts = {
      -- animate = { enabled = true },      -- efficient animations
      -- bigfile = { enabled = true },      -- deal with big files
      -- bufdelete = { enabled = true },    -- delete buffers conveneiently
      dashboard = { enabled = false },      -- declarative dashboards
      -- dim = { enabled = false },         -- dim everything outside scope
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
      -- scroll = { enabled = true },       -- smooth scrolling
      -- terminal = { enabled = true },     -- create/toggle floating/split terminals
      -- words = { enabled = true },        -- auto-show LSP references and navigage between them
    },
  },
  { -- to add luvit to emmylua_ls for lazydev
    -- https://github.com/Bilal2453/luvit-meta
    "Bilal2453/luvit-meta",
    lazy = false,
  },
  {
    -- https://github.com/folke/lazydev.nvim
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        { path = "LazyVim", words = { "LazyVim" } },
        { path = "snacks.nvim", words = { "Snacks" } },
        { path = "lazy.nvim", words = { "LazyVim" } },
        { path = "trouble.nvim", words = { "Trouble" } },
        { path = "render-markdown.nvim", words = { "render.md" } },
      },
    },
  },
}
