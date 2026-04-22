-- /plugins/notifications.lua
-- disabled if below line is active
if true then return {} end
---@diagnostic disable: missing-fields, unnecessary-if


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
    -- --| appearance |--------------------------------------------------------------------------------------------------
  {
    -- https://github.com/folke/noice.nvim
    "folke/noice.nvim",
    enabled = true,
    ---@type NoiceConfig
    opts = {
      ---@type NoiceFormatOptions
      format = {
        notify = { spinner = "dots" },
        lsp_progress = {
          {
            " ",
            key = "progress.percentage",
            contents = {
              { "{data.progress.message} " },
            },
          },
          progress = nil,
          "({data.progress.percentage}%) ",
          { "{spinner} ", hl_group = "NoiceLspProgressSpinner" },
          { "{data.progress.title} ", hl_group = "NoiceLspProgressTitle" },
          { "{data.progress.client} ", hl_group = "NoiceLspProgressClient" },
        },
        lsp_progress_done = {
          { "✔ ", hl_group = "NoiceLspProgressSpinner" },
          { "{data.progress.title} ", hl_group = "NoiceLspProgressTitle" },
          { "{data.progress.client} ", hl_group = "NoiceLspProgressClient" },
        },
      },
      notify = {
        enabled = true,
        view = "mini",
      },
      messages = {
        enabled = true,
        view = "mini", -- default view for messages
        view_error = "mini", -- view for errors
        view_warn = "mini", -- view for warnings
      },
      ---@type NoiceConfigViews
      views = {
        cmdline = { border = { style = "single" } },
        cmdline_input = { border = { style = "single" } },
        cmdline_popup = { border = { style = "single" } },
        confirm = { border = { style = "single" } },
        notify = { replace = true },
        popup = { border = { style = "single" } },
        popupmenu = { border = { style = "single" } },
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
