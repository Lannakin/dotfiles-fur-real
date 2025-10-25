-- plugins/noice.lua
-- disabled if below line is active
-- if true then return {} end
return {
  {
    "folke/noice.nvim",
    enabled = true,
    opts = {
      views = {
        cmdline = {
          border = {
            style = "single",
            padding = { 0, 0 },
          },
        },
        cmdline_popup = {
          border = { style = "single" },
          position = {
            row = 5,
            col = "50%",
          },
          size = {
            width = 60,
            height = "auto",
          },
        },
        popupmenu = {
          relative = "editor",
          position = {
            row = 8,
            col = "50%",
          },
          size = {
            width = 60,
            height = 10,
          },
          border = {
            style = "single",
            padding = { 0, 1 },
          },
          win_options = {
            winhighlight = { Normal = "Normal", FloatBorder = "NoiceCmdlinePopupBorder" },
          },
        },
      },
    },
    config = function(_, opts)
      require("noice").setup(opts)
    end,
  },
}
