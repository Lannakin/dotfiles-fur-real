-- /plugins/lsp/language.template
-- /plugins/lsp/lang.lua
-- disabled if below line is active
-- if true then return {} end
-- disabled until set up
-- https://github.com/author/repo

-- local util = require("util")

return {
  {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  opts = {},
  },
  --[[  { -- Add lang_name to treesitter
    -- https://github.com/nvim-treesitter/nvim-treesitter
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      util.list_insert_unique(opts.ensure_installed, { "typescript" })
    end,
  }, --]]
  --[[  { -- Add tools to mason
    -- https://github.com/mason-org/mason.nvim
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "typescript-tools",
        -- "formatter_name"
      })
    end,
  }, --]]
  --[[  { -- Setup adapters as nvim-dap dependencies
    -- https://github.com/mfussenegger/nvim-dap
    "mfussenegger/nvim-dap",
    dependencies = { "author/adapter-repo" },
  }, --]]
  --[[  { -- Add adapter_name debugger to mason DAP to auto-install
    -- Not absolutely necessary to declare adapter in `ensure_installed`, since `mason-nvim-dap`
    -- has `automatic-install = true` in LazyVim by default and it automatically installs adapters
    -- that are are set up (via dap) but not yet installed. Might as well skip the lines below as
    -- a whole.
    -- https://github.com/jay-babu/mason-nvim-dap.nvim
    "jay-babu/mason-nvim-dap.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
      -- "adapter_name",
      }),
    end,
  }, --]]
  --[[  { -- Add ls_name and setup lspconfig
    -- https://github.com/neovim/nvim-lspconfig
    "neovim/nvim-lspconfig",
    dependencies = {},
    opts = {
      servers = {
        ls_name = {},
        },
      setup = {
          ls_name = function(_, opts)
        end,
      },
    },
  }, --]]
  --[[  { -- Setup none-ls with formatter_name
    -- https://github.com/nvimtools/none-ls.nvim
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = vim.list_extend(opts.sources, { nls.builtins.formatting.formatter_name })
    end,
  }, --]]
}
