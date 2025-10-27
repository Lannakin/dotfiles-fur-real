-- /plugins/git.lua
-- disabled if below line is active
-- if true then return {} end
-- disabled until set up
return {
  {
    --https://github.com/NeogitOrg/neogit
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim",        -- optional - Diff integration

      -- Only one of these is needed.
      "nvim-telescope/telescope.nvim", -- optional
      -- "ibhagwan/fzf-lua",              -- optional
      -- "nvim-mini/mini.pick",           -- optional
      -- "folke/snacks.nvim",             -- optional
    },
  },
  {
    "rhysd/committia.vim",
    -- event = "BufRead",
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
  },
}
