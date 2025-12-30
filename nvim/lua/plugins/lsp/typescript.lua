-- ./plugins/lsp/typescript.lua
-- disabled if below line is active
-- if true then return {} end

return {
  {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  opts = {},
  },
}
