-- /plugins/lualine.lua
-- disabled if below line is active
-- if true then return {} end
if true then return {} end

return {
  {
    "nvim-lualine/lualine.nvim",
    -- tag = "legacy",
    -- version = false,
    opts = {
      theme = "solarized_light",
    },
    config = function()
      require("lualine").setup()
    end,
  },
}
