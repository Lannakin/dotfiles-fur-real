-- /plugins/lsp/lspsaga.lua
-- disabled if below line is active
-- if true then return {} end
return {
  -- https://github.com/nvimdev/lspsaga.nvim
  "nvimdev/lspsaga.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional
    "nvim-tree/nvim-web-devicons", -- optional
  },
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
        -- expand_collaspe = "u",
        quit = "q",
      },
    },
  },
}
