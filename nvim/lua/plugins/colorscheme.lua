-- /plugins/colorscheme.lua
--  extra theme configs in /plugins/colorschemes
-- disabled if below line is active
-- if true then return {} end
return {
  -- Add colorscheme plugin
  { "Lannakin/nvim-solarized-lua" },
  -- { "maxmx03/solarized.nvim" },  -- attempts to call nil value
  -- { "shaunsingh/solarized.nvim" }, -- attempts to call nil value
  { "Tsuzat/NeoSolarized.nvim" },

  -- Configure LazyVim to load preferred colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "solarized",
      colorscheme = "solarized",
    },
  },
}
