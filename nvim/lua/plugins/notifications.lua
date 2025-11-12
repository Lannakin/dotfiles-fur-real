-- /plugins/notifications.lua
-- disabled if below line is active
if true then return {} end
---@module "lazy"
-- shows notifications less obnoxiously in bottom right corner

---@type LazySpec
return {
  {
     -- https://github.com/folke/noice.nvim
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    },
    opts = {
      ---@type NoiceConfig
      notify = {
        enabled = true,
        view = "mini",
      },
      messages = {
        enabled = true,
        view = "mini",          -- default view for messages
        view_error = "mini",    -- view for errors
        view_warn = "mini",     -- view for warnings
      },
    },
  },
  --[[
  {
    -- https://github.com/rcarriga/nvim-notify
    "rcarriga/nvim-notify",
    opts = {
      render = "wrapped-compact",
      top_down = false,
    },
  },
  --]]
}
