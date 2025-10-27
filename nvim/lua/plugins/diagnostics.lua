-- /plugins/diagnostics.lua
-- disabled if below line is active
-- if true then return {} end

return {
  {
    -- https://github.com/folke/trouble.nvim
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = {
      {
        ---@type trouble.Window.opts
        modes = {
          lsp = {
            win = { position = "right" },
          },
          diagnostics_buffer = {
            mode = "diagnostics", -- inherit from diagnostics mode
        }
      }
    },
    keys = {
      -- If I close the incorrect pane, I can bring it up with ctrl+o
      ["<esc>"] = "close Trouble",
    },
  }
}

