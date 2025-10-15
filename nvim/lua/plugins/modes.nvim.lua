-- if true then return {} end
-- https://github.com/mvllow/modes.nvim
return {
  {
    "mvllow/modes.nvim",
    tag = "v0.2.1",
    config = function()
      require("modes").setup()
    end,
  },
}
