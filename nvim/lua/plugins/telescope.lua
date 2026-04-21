-- /plugins/telescope.lua
-- disabled if below line is active
-- if true then return {} end
---@diagnostic disable: missing-fields

---@type LazySpec
return {
  {
    -- https://github.com/nvim-telescope/telescope.nvim
    "nvim-telescope/telescope.nvim",
    -- opts = {},
    cmd = "Telescope",
    build = "make",
    -- stylua: ignore
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "DrKJeff16/project.nvim" },                     -- https://github.com/DrKJeff16/project.nvim
      { "andrew-george/telescope-themes" },             -- https://github.com/andrew-george/telescope-themes
      { "nyarthan/telescope-code-actions.nvim" },       -- https://github.com/nyarthan/telescope-code-actions.nvim
      { "nvim-telescope/telescope-file-browser.nvim" }, -- https://github.com/nvim-telescope/telescope-file-browser.nvim
      -- { "hasansujon786/telescope-ui-select.nvim" },    -- https://github.com/hasansujon786/telescope-ui-select.nvim
    },

    -- config = function() -- global settings
    opts = function()
      local telescope = require "telescope"
      -- load extensions --
      telescope.load_extension "projects"
      telescope.load_extension "themes"
      telescope.load_extension "file_browser"
      telescope.load_extension "code_actions"
      -- telescope.load_extension "find_template"
      return {
        extensions = {
          projects = {
            prompt_prefix = "󱎸  ",
            layout_strategy = "horizontal",
            layout_config = {
              anchor = "N",
              height = 0.25,
              width = 0.6,
              prompt_position = "bottom",
            },
          },
        },

        defaults = {
          border = true,
          borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
          pickers = {
            -- File and text search in hidden files and directories --
            find_files = {
              -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
              find_command = {
                "rg",
                "--files",
                "--hidden",
                "--glob",
                "!**/.git/*",
              },
            }, -- File and text search in hidden files and directories - end --
          },

          file_browser = {
            theme = "ivy",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
          },
        },
      }
    end,
  },
}
