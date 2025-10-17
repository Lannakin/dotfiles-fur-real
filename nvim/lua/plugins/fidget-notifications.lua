-- disabled if below line is active
-- if true then return {} end

return {
  "j-hui/fidget.nvim",
  tag = "legacy",
  config = function()
      require("fidget").setup()
  end
}
