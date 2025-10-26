-- /plugins/lsp/json_ls.lua
-- disabled if below line is active
-- if true then return {} end
-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/jsonls.lua
---@type vim.lsp.Config
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      jsonls = {
        cmd = { "vscode-json-language-server", "--stdio" },
        filetypes = { "json", "jsonc" },
        init_options = {
          provideFormatter = true,
        },
        root_markers = { ".git" },
        single_file_support = true,
      },
    },
  },
}
