-- if true then return {} end
-- https://github.com/DrKJeff16/project.nvim
return {
  "DrKJeff16/project.nvim",
  version = false, -- Get the latest release
  dependencies = { -- OPTIONAL
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "ibhagwan/fzf-lua",
  },
  ---@module 'project'

  ---@type Project.Config.Options
  opts = {},
}
