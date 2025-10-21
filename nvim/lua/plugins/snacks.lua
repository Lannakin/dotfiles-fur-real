-- /plugins/snacks.lua
-- disabled if below line is active
if true then return {} end
return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    -- picker = { enabled = false },
    ---@type table<string, snacks.win.Config>
    styles = {
      -- relative 'cursor'|'editor'|'laststatus'|'mouse'|'tabline'|'win'
      blame_line = { border = "single", relative = "editor" },
      input = { border = "single", relative = "editor" },
      notification = { border = "single", relative = "editor" },
      notification_history = { border = "single", relative = "editor" },
      scratch = { border = "single", relative = "editor" },
      snacks_image = { border = "single", relative = "editor" },
    },
    -- if this section is not like so, no single border.
    -- however, it also just breaks the projects menu?
    picker = {
      layout = {
        box = "horizontal",
        width = 0.8,
        min_width = 120,
        height = 0.8,
        {
          -- box = "vertical",
          border = "single",
          title = "{title} {live} {flags}",
          { win = "input", height = 1, border = "bottom" },
          { win = "list", border = "none" },
        },
        { win = "preview", title = "{preview}", border = "single", width = 0.5 },
      },
    },
  },
}