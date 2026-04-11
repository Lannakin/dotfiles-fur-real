-- /plugins/keymaps-which-key.lua
-- disabled if below line is active
-- if true then return {} end

-- +----------------------------------------------------+
-- |  Custom Command Keymaps for Which-Key Integration  |
-- +----------------------------------------------------+

-- local fanyutils = require "utils.fanyutils"
local plenary_utils = require "utils.plenary-utils"
local diag = require "utils.jellydn_diagnostics"

local opts = { noremap = true, silent = true }

-- local unmap = vim.keymap.del

---@type LazySpec
return {
  {
    -- https://github.com/folke/which-key.nvim
    "folke/which-key.nvim",
    lazy = false,
    priority = 0,
    opts = {
      spec = {
        {
          mode = { "n" },
          -- --| jellydn: toggle diagnostics level |---------------------------------------------------------------------
          -- src: jellydn github
          { "<leader>u", group = "diagnostics" },
          -- stylua: ignore start
          { "<leader>uD", function() diag.toggle_diagnostics_level() end, desc = "Toggle Diagnostics Level", opts },
          -- stylua: ignore end
        },
        {
          mode = { "n" },
          {
            "<C-Left>",
            function() require("smart-splits").resize_left() end,
            desc = "Resize window left"
          },
          {
            "<C-Right>",
            function() require('smart-splits').resize_right() end,
            desc = "Resize window right"
          },
          {
            "<C-Up>",
            function() require('smart-splits').resize_up() end,
            desc = "Resize window up"
          },
          {
            "<C-Down>",
            function() require('smart-splits').resize_down() end,
            desc = "Resize window down"
          },

        },
        -- stylya: ignore
        {
          -- --| File Operations |---------------------------------------------------------------------------------------
          mode = { "n", "v" },
          { "<leader>f", group = "files" },
          -- --| fanyutils: file path copying |--------------------------------------------------------------------------
          -- src: https://github.com/fanlumaster/lazyvim-archlinux/blob/master/lua/fany/fanykeymaps.lua

          -- [ copy relative file path ] --
          { "<leader>fp", function() plenary_utils.copy_relative_path() end, desc = "Copy file relative path" },
          -- [ copy current file name ] --
          -- FIXME: opens a new buffer and copies nothing?
          { "<leader>fn", function() plenary_utils.copy_file_name() end, desc = "Copy current file name" },
          -- [ copy absolute path ] --
          { "<leader>fP", function() plenary_utils.copy_absolute_path() end, desc = "Copy absolute path" },
        },
        {
          -- --| Neotree |-----------------------------------------------------------------------------------------------
          mode = "n",
          -- [ leader ] --
          { "<leader>d", group = "directory" },
          { "<leader>dg", "<CMD>:Neotree float git_status<CR>", desc = "Toggle git status with Neotree" },
          { "<leader>ds", "<CMD>:Neotree right document_symbols<CR>", desc = "Toggle toggle document symbols with Neotree" },
        },
      },
    },
  },
}

