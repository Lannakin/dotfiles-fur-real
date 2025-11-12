-- /plugins/weirdstuff.lua
-- disabled if below line is active
-- if true then return {} end

-- stuff that i probably really shouldn't have in neovim
---@type LazyPluginSpec
return {
  -- https://github.com/jiriks74/presence.nvim
  "jiriks74/presence.nvim",
  event = "UIEnter",
  opts = {
    -- General options
    auto_update         = true,                 -- Update activity based on autocmd events
    neovim_image_text   = "a real text editor", -- Text displayed when hovered over the Neovim image
    main_image          = "neovim",             -- Main image display (either "neovim" or "file")
    log_level           = nil,                  -- Log messages at / above level: "debug", "info", "warn", "error"
    debounce_timeout    = 10,                   -- Number of seconds to debounce events
    enable_line_number  = false,                -- Displays the current line number instead of the current project
    blacklist           = {},                   -- list of strings or patterns that disable Rich Presence when matched
    blacklist_repos     = {},                   -- blacklist that applies to git remote repo URLs instead
    buttons             = true,                 -- Configure Rich Presence button(s)
    file_assets         = {},                   -- Custom file asset definitions (see `lua/presence/file_assets.lua`)
    show_time           = true,                 -- Show the timer

    -- Rich Presence text options
    editing_text        = "Editing %s",         -- Format string rendered when an editable file is loaded in the buffer
    file_explorer_text  = "Browsing %s",        -- Format string rendered when browsing a file explorer
    git_commit_text     = "Committing changes", -- Format string rendered when committing changes in git
    plugin_manager_text = "Managing plugins",   -- Format string rendered when managing plugins
    reading_text        = "Reading %s",         -- Format string rendered when a read-only or unmodifiable file
    workspace_text      = "Working on %s",      -- Format string rendered when in a git repository
    line_number_text    = "Line %s out of %s",  -- Format string
  },
}
