-- /plugins/modes-nvim.lua
-- disabled if below line is active
-- if true then return {} end
-- https://github.com/mvllow/modes.nvim
return {
  {
    "mvllow/modes.nvim",
    config = function()
      require("modes").setup()
    end,
  },
}
