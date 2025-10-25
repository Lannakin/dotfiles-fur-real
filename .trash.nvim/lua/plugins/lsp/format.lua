-- /plugins/format.lua
-- disabled if below line is active
if true then return {} end
-- https://github.com/sbdchd/neoformat
return {
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason-org/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    --[[  config = function()
    require("config.null-ls")
  end,]]
    {
      "sbdchd/neoformat",
    },
  },
}
