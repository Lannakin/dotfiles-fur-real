-- /plugins/which-key.lua
-- disabled if below line is active
-- if true then return {} end
return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      ---@type wk.Win.opts
      win = {
        border = "single",
      },
    },
  },
}
