-- /plugins/statusline.lua
-- disabled if below line is active
-- if true then return {} end

return {
    -- https://github.com/nvim-lualine/lualine.nvim
  "nvim-lualine/lualine.nvim",
    dependencies = { "DaikyXendo/nvim-material-icon", opts = {} },
    opts = require("plugins.lualine.themes.slanted_gaps_la")
    -- opts = require("plugins.lualine.themes.evil_la")
}
