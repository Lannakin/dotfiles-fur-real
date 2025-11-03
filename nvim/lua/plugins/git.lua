-- /plugins/git.lua
-- disabled if below line is active
-- if true then return {} end
-- disabled until set up
return {
  -- {
  --   -- https://github.com/NeogitOrg/neogit
  --   "NeogitOrg/neogit",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim", -- required
  --     "sindrets/diffview.nvim", -- optional - Diff integration
  --     "nvim-telescope/telescope.nvim", -- optional
  --   },
  -- },
  {
    -- https://github.com/rhysd/committia.vim
    "rhysd/committia.vim",
    event = "BufRead",
    opts = {},
    cond = function()
      return vim.uv.fs_stat(vim.uv.cwd() .. "/.git") or vim.fn.finddir(".git", ";") ~= ""
    end,
    init = function()
      vim.g.committia_min_window_width = 130
      vim.g.committia_edit_window_width = 60
    end,
    keys = {
      { "<leader>GC", "<cmd>call committia#open('git')<cr>", desc = "Open Committia" },
    },
    {
      -- https://github.com/sindrets/diffview.nvim
      -- "sindrets/diffview.nvim",
      -- https://github.com/3dyuval/diffview.nvim
      "3dyuval/diffview.nvim",
      cmd = { "DiffviewOpen" },
      opts = {},
    },
  },
}
