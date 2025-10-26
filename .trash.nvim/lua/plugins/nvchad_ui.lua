-- /plugins/nvchad_ui.lua
-- disabled if below line is active
if true then return {} end
-- disabled until set up
-- https://github.com/NvChad/ui
return {
  {
    "nvim-lua/plenary.nvim",
    { "nvim-tree/nvim-web-devicons", lazy = true },

    {
      "nvchad/ui",
      config = function()
        require("nvchad")
      end,
    },

    {
      "nvchad/base46",
      lazy = true,
      build = function()
        require("base46").load_all_highlights()
      end,
    },

    "nvchad/volt", -- optional, needed for theme switcher
    -- or just use Telescope themes
  },
}
