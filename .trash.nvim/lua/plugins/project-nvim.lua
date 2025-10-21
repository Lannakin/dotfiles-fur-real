-- disabled; moved
if true then return {} end
-- https://github.com/DrKJeff16/project.nvim
return {
  "DrKJeff16/project.nvim",
  lazy = true,
  version = false, -- Get the latest release
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
  dependencies = { -- OPTIONAL
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "ibhagwan/fzf-lua",
  },
  ---@module 'project'
  ---@type Project.Config.Options
  opts = {
    patterns = { ".git", ".github", "*.sln", "build/env.sh" },
  },
  config = function(_, opts)
    require("project").setup(opts)
  end,
}
