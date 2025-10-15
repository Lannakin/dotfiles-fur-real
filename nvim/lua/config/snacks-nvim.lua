-- if true then return {} end

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = true }, --edit
    indent = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    picker = { enabled = true },
    picker = { enabled = true, border = "single" },
    scratch = { enabled = true, border = "single" },
    snacks_image = { enabled = true, border = "single" },
  },
}
