-- /plugins/keymaps-which-key.lua
-- disabled if below line is active
-- if true then return {} end

-- +----------------------------------------------------+
-- |  Custom Command Keymaps for Which-Key Integration  |
-- +----------------------------------------------------+

local wk = require "which-key"
local fanyutils = require "utils.fanyutils"
local diag = require "utils.jellydn_diagnostics"
local opts = { noremap = true, silent = true }

---@type LazySpec

return {
  {
    -- https://github.com/folke/which-key.nvim
    "folke/which-key.nvim",
    wk.add {
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
        mode = { "n", "v" },
        -- --| File Operations |---------------------------------------------------------------------------------------
        { "<leader>f", group = "files" },

        -- --| fanyutils: file path copying |--------------------------------------------------------------------------
        -- src: https://github.com/fanlumaster/lazyvim-archlinux/blob/master/lua/fany/fanykeymaps.lua

        -- stylua: ignore start
        -- copy relative file path
        { "<leader>fp", function() fanyutils.copy_relative_path() end, desc = "Copy file relative path" },
        -- { "<leader>fP", '<C-R>=expand("%:p")<CR>', desc = "Copy absolute file path", opts },
        -- copy current file name
        -- FIXME: opens a new buffer and copies nothing?
        { "<leader>fn", function() fanyutils.copy_current_filename() end, desc = "Copy current file name" },
        -- src: https://github.com/fanlumaster/lazyvim-archlinux/blob/master/lua/fany/fanykeymaps.lua
        -- copy absolute path
        { "<leader>fP", function() fanyutils.copy_absolute_path() end, desc = "Copy absolute path" },
        -- stylua: ignore end
      },
    },
  },
}
