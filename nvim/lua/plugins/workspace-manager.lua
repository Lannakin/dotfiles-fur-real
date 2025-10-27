-- /plugins/workspace-manager.lua
-- disabled if below line is active
if true then return {} end
-- disabled until set up
-- https://github.com/Dax89/automaton.nvim
return {
  {
    "Dax89/automaton.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "mfussenegger/nvim-dap",  -- Debug support for 'launch' configurations (Optional)
      -- "hrsh7th/nvim-cmp",       -- Autocompletion for automaton workspace files (Optional)
      "Saghen/blink.cmp",       -- Autocompletion for automaton workspace files (Optional)
      "L3MON4D3/LuaSnip",       -- Snippet support for automaton workspace files (Optional)
    },
    opts = {
      integrations = {
        luasnip = true,
        cmp = true,
    },
    },
  },
}
