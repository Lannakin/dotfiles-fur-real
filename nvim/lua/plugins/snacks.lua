-- /plugins/snacks.lua
-- disabled if below line is active
-- if true then return {} end
return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    ---@type table<string, snacks.win.Config>
    styles = {
      blame_line = { border = "single" },
      input = { border = "single" },
      notification = { border = "single" },
      notification_history = { border = "single" },
      scratch = { border = "single" },
      snacks_image = { border = "single" },
    },
    -- picker = {
    --   layout = {
    --     box = "horizontal",
    --     width = 0.8,
    --     min_width = 120,
    --     height = 0.8,
    --     {
    --       box = "vertical",
    --       border = "single",
    --       title = "{title} {live} {flags}",
    --       { win = "input", height = 1, border = "bottom" },
    --       { win = "list", border = "none" },
    --     },
    --     { win = "preview", title = "{preview}", border = "single", width = 0.5 },
    --   },
    -- },
  },
}
