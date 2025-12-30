-- ./plugins/lsp/lsp-tools.lua
-- disabled if below line is active
-- if true then return {} end

return {
  -- --| syntax |------------------------------------------------------------------------------------------------------
  { -- used by LSPs
    -- https://github.com/nvim-treesitter/nvim-treesitter-context
    "nvim-treesitter/nvim-treesitter-context",
    event = "LazyFile",
    opts = function()
      -- local tsc = require "treesitter-context"
      return { mode = "cursor", max_lines = 3 }
    end,
  },
  -- --| GUI stuff |---------------------------------------------------------------------------------------------------
  {
    -- https://github.com/jinzhongjia/LspUI.nvim
    "jinzhongjia/LspUI.nvim",
    branch = "main",
    opts = function()
      return {
        rename = {
          enable = true,
          command_enable = true,
          auto_select = true,
          fixed_width = false,
          border = "single",
          transparency = 0,
        },
        -- Code Action configuration
        code_action = {
          enable = true,
          command_enable = true,
          gitsigns = true,
          border = "single",
          transparency = 0,
        },

        -- Hover configuration
        hover = {
          enable = true,
          command_enable = true,
          key_binding = {
            prev = "p",
            next = "n",
            quit = "q",
          },
          border = "single",
        },

        -- Diagnostic configuration
        diagnostic = {
          enable = true,
          command_enable = true,
          border = "single",
          severity = nil,
          show_source = true,
          show_code = true,
          show_related_info = true,
          max_width = 0.6,
        },

        -- Lightbulb configuration
        lightbulb = {
          enable = false,
          is_cached = true,
          icon = "💡",
          debounce = 250,
        },

        -- Inlay Hint configuration
        inlay_hint = {
          enable = true,
          command_enable = true,
          filter = {
            whitelist = {},
            blacklist = {},
          },
        },

        -- Signature configuration
        signature = {
          enable = false,
          icon = "✨",
          color = {
            fg = "#FF8C00",
            bg = nil,
          },
          debounce = 300,
        },

        -- Definition, Reference, Implementation, Type Definition, Declaration
        definition = {
          enable = true,
          command_enable = true,
        },
        reference = {
          enable = true,
          command_enable = true,
        },
        implementation = {
          enable = true,
          command_enable = true,
        },
        type_definition = {
          enable = true,
          command_enable = true,
        },
        declaration = {
          enable = true,
          command_enable = true,
        },

        -- Call Hierarchy configuration
        call_hierarchy = {
          enable = true,
          command_enable = true,
        },

        -- Position keybinds for definition, reference, etc.
        pos_keybind = {
          main_border = "none",
          secondary_border = "single",
        },
      }
    end,
    -- stylua: ignore
    keys = {
      { "k",            "<cmd>LspUI hover<CR>",           desc = "Open LSP hover window" },

      { "<leader>lsr",  "<cmd>LspUI reference<CR>",       desc = "Show all references" },
      { "<leader>ld",   "<cmd>LspUI definition<CR>",      desc = "Go to definition" },
      { "<leader>ltd",  "<cmd>LspUI type_definition<CR>", desc = "Go to type definition" },
      { "<leader>lsi",  "<cmd>LspUI implementation<CR>",  desc = "Show all implementations" },
      { "<leader>lrn",  "<cmd>LspUI rename<CR>",          desc = "Rename symbol" },
      { "<leader>lca",  "<cmd>LspUI code_action<CR>",     desc = "Open code action selector" },

      { "<leader>li",   "<cmd>LspUI call_hierarchy incoming_calls<CR>", desc = "Show call hierarchy, incoming calls" },
      { "<leader>lo",   "<cmd>LspUI call_hierarchy outgoing_calls<CR>", desc = "Show call hierarchy, outgoing calls" },
    },
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
    -- orig: https://github.com/nvimdev/lspsaga.nvim
    -- updates+fixes: https://github.com/boydaihungst/lspsaga.nvim
    "boydaihungst/lspsaga.nvim", -- fixes
    enabled = false,
    -- stylua: ignore start
    dependencies = {
      "nvim-treesitter/nvim-treesitter",  -- optional
      "nvim-tree/nvim-web-devicons",      -- optional
    },
    -- stylua: ignore end
    cmd = "Lspsaga",
    opts = {
      lightbulb = { ignore = { clients = { "dev-tools" } } },
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
  },
  {
    "folke/which-key.nvim",
    keys = {
      { "<leader>l", group = "lsp" },
      { "<Leader>lo", "<Cmd>Lspsaga outline<CR>", desc = "Show Lspsaga outline" },
    },
  },
  --]]
  --[[
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
  --]]
  --[[
  { -- provides hover info in a split window
    -- https://github.com/roobert/hoversplit.nvim
    "roobert/hoversplit.nvim",
    opts = function()
      return {
        key_bindings = {
          split_remain_focused = "<leader>hh",
          vsplit_remain_focused = "<leader>hv",
          split = "<leader>hH",
          vsplit = "<leader>hV",
        },
      }
    end,
  },
  --]]
  --[[
  { -- code action customization
    -- https://github.com/yarospace/dev-tools.nvim
    "yarospace/dev-tools.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- code manipulation in buffer, required
      {
        "folke/snacks.nvim", -- optional
        opts = {
          picker = { enabled = true }, -- actions picker
          terminal = { enabled = true }, -- terminal for running spec actions
        },
      },
      {
        "ThePrimeagen/refactoring.nvim", -- refactoring library, optional
        dependencies = { "nvim-lua/plenary.nvim" },
      },
    },
    opts = {
      actions = {},
      filetypes = { -- filetypes for which to attach the LSP
        include = {}, -- {} to include all, except for special buftypes, e.g. nofile|help|terminal|prompt
        exclude = {},
      },
    },
  },
  --]]
}
