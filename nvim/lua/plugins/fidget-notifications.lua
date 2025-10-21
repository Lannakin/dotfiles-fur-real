-- /plugins/fidget-notifications.lua
-- disabled if below line is active
-- if true then return {} end
return {
  "j-hui/fidget.nvim",
  -- tag = "legacy",
  version = false,
  config = function()
      require("fidget").setup()
  end
}
