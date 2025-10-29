-- /plugins/notifications.lua
-- disabled if below line is active
-- if true then return {} end
-- shows notifications less obnoxiously in bottom right corner
return {
  {
     -- https://github.com/folke/noice.nvim
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      notify = { view = "mini" },
    },
    messages = {
    view = "mini", -- default view for messages
    view_error = "mini", -- view for errors
    view_warn = "mini", -- view for warnings
    },
  },
}
