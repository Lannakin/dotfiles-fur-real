-- /plugins/completion.lua
-- disabled if below line is active
-- if true then return {} end
return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },
  ---@module 'blink.cmp'
  opts = {
    keymap = { preset = "super-tab" },
  },
}
