-- ./plugins/lsp/json.lua
-- disabled if below line is active
-- if true then return {} end
-- https://github.com/neovim/nvim-lspconfig/blob/master/lsp/jsonls.lua

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "json", "json5" })
      end
    end,
  },
  {
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
    setup = {},
  },
}
