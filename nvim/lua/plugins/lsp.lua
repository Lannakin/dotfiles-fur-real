-- /plugins/lsp-config.lua
-- disabled if below line is active
-- if true then return {} end
vim.lsp.enable { "emmylua_ls" }

return {
  {
    -- https://github.com/mason-org/mason.nvim
    "mason-org/mason.nvim",
    cmd = "Mason",
    -- opts_extend = { "ensure_installed" },
    opts = {
      ensure_installed = {
        -- "emmylua_ls",  -- this probably shouldn't be done like this LOL
        "shfmt",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      autoformat = false,
      codelens = {
        enabled = false, -- Run `lua vim.lsp.codelens.refresh({ bufnr = 0 })` for refreshing code lens
      },
      diagnostics = {
        float = {
          source = true,
        },
        virtual_text = {
          prefix = "icons",
          spacing = 4,
          source = true,
          -- source = "if_many",
        },
      },
      format = {
        timeout_ms = 10000, -- 10 seconds
      },
      inlay_hints = {
        enabled = true,
      },
      servers = {
        clangd = { enabled = true },

        cmakelang = { enabled = true },
        cmakelint = { enabled = true },

        lua_ls = { enabled = false },
        emmylua_ls = { enabled = true },
        stylua = { enabled = false },

        jsonls = { enabled = true },

        markdown_oxide = { enabled = true },
        marksman = { enabled = false },

        bashls = { enabled = true },
        shellcheck = { enabled = true },
      },
      setup = {},
    },
  },
  -- Import extra lsp languages configs
  { import = "plugins.lsp" },
}
