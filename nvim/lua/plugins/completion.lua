-- /plugins/blink-cmp.lua
-- disabled if below line is active
-- if true then return {} end
return {
  {
    -- https://github.com/Saghen/blink.cmp
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    ---@module 'blink.cmp'
    opts = {
      keymap = { preset = "super-tab" },
    },
  },
  {
    -- https://github.com/neoclide/coc.nvim
    "neoclide/coc.nvim",
    branch = "release",
  },
}
