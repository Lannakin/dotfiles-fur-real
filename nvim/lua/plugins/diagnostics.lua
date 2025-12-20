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
          },
        },
      },
    },
    keys = {
      ["<esc>"] = "close Trouble",
    },
  },
}
