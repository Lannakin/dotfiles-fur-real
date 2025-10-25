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
}
}
