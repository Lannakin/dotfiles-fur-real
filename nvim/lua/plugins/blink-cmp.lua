-- /plugins/blink-cmp.lua
-- disabled if below line is active
-- if true then return {} end
return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = "super-tab" },
  },
}
