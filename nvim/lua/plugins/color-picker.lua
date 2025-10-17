-- disabled if below line is active
-- if true then return {} end
return {
  "uga-rosa/ccc.nvim",
  tag = "v2.0.3",
  config = function()
    require("config.color-picker")
  end,
}

