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
  -- { -- replacing persistence
  --   -- https://github.com/Shatur/neovim-session-manager
  --   "Shatur/neovim-session-manager",
  --   opts = function ()
  --     local Path = require('plenary.path')
  --     local config = require('session_manager.config')
  --     return {
  --       sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'), -- save sessions in...
  --
  --       session_filename_to_dir = session_filename_to_dir, -- transform filename into session directory by replacing
  --                                                          -- symbols w/ separators and colons
  --
  --       dir_to_session_filename = dir_to_session_filename, -- transform session directory into a filename by replacing
  --                                                          -- separators and colons w/ special symbols;
  --                                                          -- should use `vim.uv.cwd()` if the passed `dir` is `nil`.
  --
  --       autoload_mode = { disabled },       -- define what to do when Neovim is started without arguments
  --       autosave_last_session = true,       -- autosave last session on exit and on session switch
  --       autosave_ignore_not_normal = true,  -- will not save a session when no buffers are opened etc
  --       autosave_ignore_dirs = {},          -- list of directories where the session will not be autosaved
  --       autosave_ignore_filetypes = {       -- buffers of these file types will be closed before session is saved
  --         'gitcommit',
  --         'gitrebase',
  --       },
  --       autosave_ignore_buftypes = {},      -- buffers of these types will be closed before session is saved
  --       autosave_only_in_session = false,   -- always autosave session; true = only autosave after session is active
  --       max_path_length = 80,               -- shorten the display path if length exceeds threshold; disabled = 0
  --       load_include_current = false,       -- currently loaded session appears in load_session UI
  --     }
  --   end
  -- },
  { -- replacing persistence as it seems unwilling to save sessions on quit, and i am unwilling to write an autocommand
    -- https://github.com/rmagatti/auto-session
    "rmagatti/auto-session",
    lazy = true,
    keys = {
      -- Will use Telescope if installed or a vim.ui.select picker otherwise
      { "<leader>wr", "<cmd>AutoSession search<CR>", desc = "Session search" },
      { "<leader>ws", "<cmd>AutoSession save<CR>", desc = "Save session" },
      { "<leader>wa", "<cmd>AutoSession toggle<CR>", desc = "Toggle autosave" },
    },

    -- enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      bypass_save_filetypes = { "alpha", "dashboard", "snacks_dashboard" }, -- or whatever dashboard you use
      suppressed_dirs = { "~/", "~/Downloads", "/", "~/.local/share/nvim" },

      -- Saving / restoring
      enabled = true,                    -- Enables/disables auto creating, saving and restoring
      auto_save = true,                  -- Enables/disables auto saving session on exit
      auto_restore = false,              -- Enables/disables auto restoring session on start
      auto_create = true,                -- Enables/disables auto creating new session files; can be a function
      auto_restore_last_session = false, -- On startup, loads last saved session if session for cwd does not exist

      ---@type SessionLens
      session_lens = {
        picker = "telescope",
        load_on_setup = true,

        picker_opts = {
          borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        }
      },
    },
  },
}
