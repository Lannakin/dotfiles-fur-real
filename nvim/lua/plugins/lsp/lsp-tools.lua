-- /plugins/lsp/lsp-tools.lua
-- disabled if below line is active
if true then return {} end
return {
  { -- codelens
    -- https://github.com/VidocqH/lsp-lens.nvim
    "VidocqH/lsp-lens.nvim",
    event = "LspAttach",
    opts = {
      sections = {
        definition = true,
        references = function(count)
          return "󰌹 Ref: " .. count
        end,
        implements = function(count)
          return "󰡱 Imp: " .. count
        end,
        -- git_authors = false,
      },
    },
    keys = {
      { "<leader>ue", "<cmd>LspLensToggle<cr>", desc = "Toggle Lsp Lens" },
    },
  },
  {
    -- https://github.com/ray-x/lsp_signature.nvim
    "ray-x/lsp_signature.nvim",
    enabled = false,
    event = "InsertEnter",
    opts = {
      bind = true,
      handler_opts = {
        border = "single",
      },
    },
  },
  { -- provides hover info in a split window
    -- https://github.com/roobert/hoversplit.nvim
    "roobert/hoversplit.nvim",
    config = function()
      require("hoversplit").setup({
        key_bindings = {
          split_remain_focused = "<leader>hh",
          vsplit_remain_focused = "<leader>hv",
          split = "<leader>hH",
          vsplit = "<leader>hV",
        },
      })
    end,
  },
  { -- lsp garbage collector
    -- https://github.com/Zeioth/garbage-day.nvim
    "zeioth/garbage-day.nvim",
    dependencies = "neovim/nvim-lspconfig",
    event = "VeryLazy",
    opts = {
      notifications = true,
      grace_period = 60 * 10,
      excluded_lsp_clients = { "null-ls", "jdtls", "marksman", "lua_ls" },
    },
  },
  {
    -- https://github.com/nvimtools/none-ls.nvim
    "nvimtools/none-ls.nvim",
    event = "LazyFile",
    dependencies = { "mason.nvim", "gbprod/none-ls-shellcheck.nvim" },
    opts = {
      sources = {
        require("none-ls-shellcheck.diagnostics"),
        require("none-ls-shellcheck.code_actions"),
      },
    },
  },
  -- possibly broken
  --[[
  -- orig: https://github.com/nvimdev/lspsaga.nvim
  -- orig: "nvimdev/lspsaga.nvim",
  -- https://github.com/SuperAPPKid/lspsaga.nvim
  "SuperAPPKid/lspsaga.nvim", -- fixes
  -- stylua: ignore start
  dependencies = {
    "nvim-treesitter/nvim-treesitter",  -- optional
    "nvim-tree/nvim-web-devicons",      -- optional
  },
  -- stylua: ignore end
  cmd = "Lspsaga",
  init = function()
    local wk = require "which-key"
    wk.add {
      { "<leader>l", group = "lsp" },
      { "<Leader>lo", "<Cmd>Lspsaga outline<CR>", desc = "Show Lspsaga outline" },
    }
  end,
  opts = {
    ui = {
      -- theme = "round",
      border = "single",
      winblend = 0,
      expand = "",
      collaspe = "",
      preview = " ",
      code_action = "󱧣 ",
      diagnostic = "🐞",
      -- hover = " ",
      kind = {},
      imp_sign = "󰳛 ",
    },

    outline = {
      win_position = "right",
      win_with = "",
      win_width = 30,
      show_detail = true,
      auto_preview = true,
      auto_refresh = true,
      auto_close = true,
      custom_sort = nil,
      keys = {
        -- jump = "o",
        -- expand_collapse = "u",
        quit = "q",
      },
    },
  },
  --]]
}
