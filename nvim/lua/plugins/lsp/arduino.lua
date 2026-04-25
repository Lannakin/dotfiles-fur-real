-- ./plugins/lsp/arduino.lua
-- disabled if below line is active
-- if true then return {} end

-- local DEFAULT_FQBN = "rp2040:rp2040:rpipicow"
local DEFAULT_FQBN = "rp2040:rp2040:wiznet_5500_evb_pico"

return {
  { -- Add arduino to treesitter
    -- https://github.com/nvim-treesitter/nvim-treesitter
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "arduino" },
    },
  },
  { -- Add tools to mason
    -- https://github.com/mason-org/mason.nvim
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "arduino-language-server",
        "clang-format",
      })
    end,
  },
  { -- Add arduino_language_server and set up lspconfig
    -- https://github.com/neovim/nvim-lspconfig
    "neovim/nvim-lspconfig",
    enabled = true,
    ---@type lazyvim.lsp.Config
    opts = {
      servers = {
        -- https://github.com/arduino/arduino-language-server
        arduino_language_server = {
          filetypes = { "arduino" },
          root_dir = function(bufnr, on_dir)
            local fname = vim.api.nvim_buf_get_name(bufnr)
            on_dir(require("lspconfig.util").root_pattern "*.ino"(fname))
          end,
          cmd = { -- You might want to keep a default cmd here too
            "arduino-language-server",
            "-clangd",
            "ccls",
            "~/.local/bin/arduino-language-server",
            "-cli",
            "/usr/bin/arduino-cli",
            "-cli-config",
            "${XDG_DATA_HOME}/arduino15/arduino-cli.yaml",
            "-fqbn",
            DEFAULT_FQBN,
          },
        },
        -- clangd = {},
        -- ccls = {},
      },
    },
  },
  {
    -- https://github.com/stevearc/conform.nvim
    "stevearc/conform.nvim",
    -- event = 'BufWritePre',
    opts = {
      formatters_by_ft = {
        ino = { "clang-format" },
        arduino = { "clang-format" },
      },
    },
  },
  { -- https://github.com/glebzlat/arduino-nvim
    "glebzlat/arduino-nvim",
    enabled = false,
    dependencies = {
      "neovim/nvim-lspconfig",
      "mason-org/mason.nvim",
    },
    opts = {
      filetypes = { "arduino" },
    },
  },
}
