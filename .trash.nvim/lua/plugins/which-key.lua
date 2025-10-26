-- /plugins/which-key.lua
-- disabled if below line is active
-- if true then return {} end
return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- colors = { Normal = "Search" },
      ---@type false | "classic" | "modern" | "helix"
      preset = "helix",
      win = {
        border = "single",
        relative = "win",
        focusable = "false",
        noautocmd = "true",
        style = "minimal",
      },
    },
    config = function(_, opts)
      require("which-key").setup(opts)
    end,
  },
}
