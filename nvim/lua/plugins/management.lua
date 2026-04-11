-- /plugins/management.lua
-- disabled if below line is active
-- if true then return {} end

---@type LazySpec
return {
  -- {
  --   -- https://github.com/Dax89/automaton.nvim
  --   "Dax89/automaton.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope.nvim",
  --     "mfussenegger/nvim-dap", -- Debug support for 'launch' configurations (Optional)
  --     -- "hrsh7th/nvim-cmp",       -- Autocompletion for automaton workspace files (Optional)
  --     "Saghen/blink.cmp", -- Autocompletion for automaton workspace files (Optional)
  --     "L3MON4D3/LuaSnip", -- Snippet support for automaton workspace files (Optional)
  --   },
  --   opts = {
  --     integrations = {
  --       luasnip = true,
  --       cmp = true,
  --     },
  --   },
  -- },
  { -- replacing persistence as it seems unwilling to save sessions on quit, and i am unwilling to write an autocommand
    -- https://github.com/rmagatti/auto-session
    "rmagatti/auto-session",
    -- lazy = false,
    cmd = { "AutoSession" },
    keys = {
      -- Will use Telescope if installed or a vim.ui.select picker otherwise
      { "<leader>wr", "<cmd>AutoSession search<CR>", desc = "Session search" },
      { "<leader>ws", "<cmd>AutoSession save<CR>", desc = "Save session" },
      { "<leader>wa", "<cmd>AutoSession toggle<CR>", desc = "Toggle autosave" },
    },

    -- enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    -- stylua: ignore
    opts = {
      bypass_save_filetypes = { "alpha", "dashboard", "snacks_dashboard" }, -- or whatever dashboard you use
      suppressed_dirs = { "/", "~/", "~/Downloads", "/", "~/.local/share/nvim" },

      -- Saving / restoring
      enabled = true,                     -- Enables/disables auto creating, saving and restoring
      auto_save = true,                   -- Enables/disables auto saving session on exit
      auto_restore = false,               -- Enables/disables auto restoring session on start
      auto_create = true,                 -- Enables/disables auto creating new session files; can be a function
      auto_restore_last_session = false,  -- On startup, loads last saved session if session for cwd does not exist

      ---@type SessionLens
      session_lens = {
        picker = "telescope",
        load_on_setup = true,

        picker_opts = {
          borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        },
      },
    },
  },
  {
    -- https://github.com/DrKJeff16/project.nvim
    "DrKJeff16/project.nvim",
    cmd = { -- Lazy-load by commands
      "Project",
      "ProjectAdd",
      "ProjectConfig",
      "ProjectDelete",
      "ProjectHistory",
      "ProjectRecents",
      "ProjectRoot",
      "ProjectSession",
    },

    ---@module "project"
    ---@type Project.Config.Options
    opts = {
      lsp = {
        enabled = true,
        use_pattern_matching = false, -- { "z", group = "fold" },
      },
      manual_mode = true,
      -- show_hidden = true,  -- this also shows inside .git/
      base_dirs = { "~/LA-repos/" },
      patterns = { ".git", ".github", "*.sln", "build/env.sh" },
      exclude_dirs = { "~/.local/nvim/" }, -- directories not to calculate root on
      disable_file_picker = true,
    },
  },
}
