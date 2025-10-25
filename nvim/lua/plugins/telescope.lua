-- /plugins/telescope.lua
-- disabled if below line is active
-- if true then return {} end
return {
  {
    -- https://github.com/nvim-telescope/telescope.nvim
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        -- https://github.com/DrKJeff16/project.nvim
        "DrKJeff16/project.nvim",
        lazy = true,
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
        ---@module 'project'
        ---@type Project.Config.Options
        opts = {
          patterns = { ".git", ".github", "*.sln", "build/env.sh" },
        },
        config = function(__, opts)
          require("project").setup(opts)  -- why
        end,
      },

      -- { "DrKJeff16/project.nvim" },
      { "andrew-george/telescope-themes" },
      { "nyarthan/telescope-code-actions.nvim" },
      -- "nvim-telescope/telescope-file-browser.nvim",
    },
    opts = {},
    cmd = "Telescope",
    build = "make",
    config = function()
      local telescope = require("telescope")
      telescope.setup({
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
          --[[
            file_browser = {
            theme = "ivy",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
          },
          --]]
        },
      })
      -- load extensions --
      telescope.load_extension("projects")
      telescope.load_extension("themes")
      -- telescope.load_extension("file_browser")
      telescope.load_extension("code_actions")
    end,
  },
}
