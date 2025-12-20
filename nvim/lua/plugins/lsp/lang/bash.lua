-- /plugins/lsp/lang/bash.lua
-- disabled if below line is active
-- if true then return {} end
-- disabled until set up

---@type vim.lsp.Config
return {
  --[[  { -- Add lang_name to treesitter
    -- https://github.com/nvim-treesitter/nvim-treesitter
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      util.list_insert_unique(opts.ensure_installed, { "lang_name" })
    end,
  }, --]]
  --[[  { -- Add tools to mason
    -- https://github.com/mason-org/mason.nvim
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "ls_name",
        "formatter_name"
      })
    end,
  }, --]]
  { -- Add bashls and setup lspconfig
    -- https://github.com/neovim/nvim-lspconfig
    "neovim/nvim-lspconfig",
    dependencies = {},
    opts = {
      servers = {
        bashls = {
          cmd = { "bash-language-server", "start" },
          filetypes = { "bash", "sh" },
          root_markers = { ".git" },
          settings =   {
            bashIde = {
              globPattern = "*@(.sh|.inc|.bash|.command)"
            }
          }
        },
        -- shellcheck = {
        --   cmd = { "shellcheck" },
        -- },
        },
    },
  },
}
