-- /plugins/buffer-tabline.lua
-- disabled if below line is active
-- if true then return {} end

return {
  {
    -- https://github.com/nanozuki/tabby.nvim
    "nanozuki/tabby.nvim",
    enabled = false,
    ---@type TabbyConfig
    opts = {
      preset = "active_wins_at_end",
      option = {
        theme = {
          fill = "TabLineFill",       -- tabline background
          head = "TabLine",           -- head element highlight
          current_tab = "TabLineSel", -- current tab label highlight
          tab = "TabLine",            -- other tab label highlight
          win = "TabLine",            -- window highlight
          tail = "TabLine",           -- tail element highlight
        },
        nerdfont = true,                    -- whether use nerdfont
        lualine_theme = "solarized-light",  -- lualine theme name
        tab_name = {
          name_fallback = function(tabid)
            return tabid
          end,
        },
        buf_name = {
          mode = "unique", -- or 'relative', 'tail', 'shorten'
        },
        sep = { '  ', "head" }
      },
    },
    config = function(_, opts)
      require("tabby").setup(opts)
    end,
  },
  {
    -- https://github.com/akinsho/bufferline.nvim
    "akinsho/bufferline.nvim",
    enabled = true,
    opts = {
      options = {
        separator_style = { " ", " " },
      },
      highlights = {
        buffer_selected = { italic = false, bold = false },
      },
    },
  },
}
