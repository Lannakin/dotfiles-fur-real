-- /plugins/weirdstuff.lua
-- disabled if below line is active
-- if true then return {} end

-- +---------------------------------------------------------+
-- |  stuff that i probably really shouldn't have in neovim  |
-- +---------------------------------------------------------+

---@type LazySpec
return {
  -- --| discord presence |--------------------------------------------------------------------------------------------
  {
    -- https://github.com/jiriks74/presence.nvim
    "jiriks74/presence.nvim",
    event = "UIEnter",
    -- stylua: ignore
    opts = {
      -- --| General options |-----------------------------------------------------------------------------------------
      -- auto_update         = true,                                 -- Update activity based on autocmd events
      buttons             = true,                                 -- Configure Rich Presence button(s)
      debounce_timeout    = 10,                                   -- seconds to debounce events
      enable_line_number  = false,                                -- Display current line number instead of current project
      log_level           = "warn",                               -- Log level: "debug", "info", "warn", "error"
      main_image          = "neovim",                             -- Main image display (either "neovim" or "file")
      neovim_image_text   = "a real arch linux text editor, btw", -- Text displayed when hovered over the Neovim image
      show_time           = true,                                 -- Show the timer

      blacklist           = { "dropbar_preview*" }, -- list of strings or patterns that disable presence when matched
      blacklist_repos     = {},                    -- blacklist that applies to git remote repo URLs instead
      file_assets         = {},                    -- Custom file asset definitions (see :lua/presence/file_assets.lua)

      -- --| Rich Presence text options |------------------------------------------------------------------------------
      editing_text        = "walking across keyboard in %s",  -- string when an editable file is loaded in the buffer
      file_explorer_text  = "stalking %s",                    -- string when browsing file explorer
      git_commit_text     = "committing ruinous changes",     -- string when committing changes in git
      line_number_text    = "line %s out of %s",              -- string for enable_line_number=true
      plugin_manager_text = "managing plugins",               -- string when managing plugins
      reading_text        = "reading %s",                     -- string when read-only or unmodifiable file
      workspace_text      = "completely ruining %s",          -- string when in a git repository
    },
  },
  {
    -- https://github.com/nvzone/showkeys
    "nvzone/showkeys",
    cmd = "ShowkeysToggle",
    opts = {
      timeout = 1,
      maxkeys = 5,
    },
  },
  { -- browse github for repos tagged neovim-plugin
    -- https://github.com/alex-popov-tech/store.nvim
    "alex-popov-tech/store.nvim",
    enabled = true,
    dependencies = { "OXY2DEV/markview.nvim" },
    cmd = "Store",
    -- stylua: ignore
    opts = {
      -- Window dimensions (percentages or absolute)
      width = 0.8,
      height = 0.8,

      -- Layout proportions (must sum to 1.0)
      proportions = {
        list = 0.3,     -- 30% for repository list
        preview = 0.7,  -- 70% for preview pane
      },

      keybindings = {
        help = { "?" },                        -- Show help
        close = { "q", "<esc>", "<c-c>" },     -- Close modal
        filter = { "f" },                      -- Open filter input
        refresh = { "r" },                     -- Refresh data
        open = { "<cr>", "o" },                -- Open selected repository
        switch_focus = { "<tab>", "<s-tab>" }, -- Switch focus between panes
        sort = { "s" },                        -- Sort repositories
      },

      -- Repository display options
      list_fields = { "full_name", "pushed_at", "stars", "forks", "issues", "tags" },
      full_name_limit = 35,              -- Max characters for repository names

      -- Behavior
      logging = "off",                   -- Levels: off, error, warn, log, debug
    },
  },
}
