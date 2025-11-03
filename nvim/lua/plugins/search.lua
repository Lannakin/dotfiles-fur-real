-- /plugins/search.lua
-- disabled if below line is active
-- if true then return {} end

---@type LazyPluginSpec[]
return {
  { -- search/replace in multiple files
    -- https://github.com/MagicDuck/grug-far.nvim
    "MagicDuck/grug-far.nvim",
    opts = {},
    keys = {
      {
        "<leader>Sr",
        function()
          local grug = require("grug-far")
          local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
          grug.open({
            transient = true,
            prefills = {
              filesFilter = ext and ext ~= "" and "*." .. ext or nil,
            },
          })
        end,
        mode = { "n", "x" },
        desc = "Search and Replace",
      },
    },
  },
}
