-- ./plugins/lsp/arduino.lua
-- disabled if below line is active
-- if true then return {} end

local util = require "lspconfig.util"
-- local DEFAULT_FQBN = "rp2040:rp2040:rpipicow"
local DEFAULT_FQBN = "rp2040:rp2040:wiznet_5500_evb_pico"

return {
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
  { -- Add arduino_language_server and setup lspconfig
    -- https://github.com/neovim/nvim-lspconfig
    "neovim/nvim-lspconfig",
    enabled = true,
    --[[
    opts = function()
      local dynamic_arduino_fqbn = {
        -- ["${LA-repos}"] = "arduino:avr:nano",
        ["${ARDUINO_PROJECTS}/rpi-pico-w/"] = "rp2040:rp2040:rpipicow",
        ["${ARDUINO_PROJECTS}/w5500-evb-pico/"] = "wiznet_5500_evb_pico",
        -- boards that are available:
        -- STMicroelectronics:stm32:GenF1
        -- STMicroelectronics:stm32:GenF4
        -- STMicroelectronics:stm32:GenF7
        -- STMicroelectronics:stm32:GenH7
        -- STMicroelectronics:stm32:GenL4
        -- STMicroelectronics:stm32:Nucleo_144
        -- STMicroelectronics:stm32:Nucleo_32
        -- STMicroelectronics:stm32:Nucleo_64
        -- rp2040:rp2040:rpipicow
        -- rp2040:rp2040:wiznet_5500_evb_pico
        -- rp2040:rp2040:waveshare_rp2350_pizero
        -- rp2040:rp2040:waveshare_rp2350_plus
        -- Infineon:xmc:XMC1100_XMC2GO
    }
    --]]
    -- return {
    opts = {
      servers = {
        -- https://github.com/arduino/arduino-language-server
        arduino_language_server = {
          filetypes = { "arduino", "c", "cpp", "objc", "objcpp" },
          --[[
          root_dir = function(bufnr, on_dir)
            local fname = vim.api.nvim_buf_get_name(bufnr)
              on_dir(util.root_pattern "*.ino"(fname))
          end,
          on_new_config = function(config, root_dir) -- Add it here as part of the server config
            local fqbn = dynamic_arduino_fqbn[root_dir]
            if not fqbn then
              vim.notify(("Could not find which FQBN to use in %q. Defaulting to %q."):format(root_dir, DEFAULT_FQBN))
            fqbn = DEFAULT_FQBN
          end
          config.cmd = {
            "arduino-language-server",
            "-clangd",
            "clangd",
            "-cli",
            "/usr/bin/arduino-cli",
            "-cli-config",
            "${XDG_DATA_HOME}/arduino15/arduino-cli.yaml",
            "-fqbn",
            fqbn,
          }
          end,
          --]]
          cmd = { -- You might want to keep a default cmd here too
            "arduino-language-server",
            "-clangd",
            "/usr/bin/clang",
            "-cli",
            "/usr/bin/arduino-cli",
            "-cli-config",
            "${XDG_DATA_HOME}/arduino15/arduino-cli.yaml",
            "-fqbn",
            DEFAULT_FQBN,
          },
          capabilities = {
            vim.lsp.protocol.make_client_capabilities(),
            textDocument = {
              -- ---@diagnostic disable-next-line: assign-type-mismatch
              semanticTokens = vim.NIL,
            },
            workspace = {
              -- ---@diagnostic disable-next-line: assign-type-mismatch
              semanticTokens = vim.NIL,
            },
          },
        },
        clangd = {},
      },
    },
    -- end,
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
  --]]
  -- { -- https://github.com/glebzlat/arduino-nvim
  --   "glebzlat/arduino-nvim",
  --   enabled = false,
  --   dependencies = {
  --     "neovim/nvim-lspconfig",
  --     "mason-org/mason.nvim",
  --   },
  --   opts = {
  --     filetypes = { "arduino" },
  --   },
  -- },
}
