-- /plugins/render-markdown.lua
-- disabled if below line is active
-- if true then return {} end

---@type LazySpec
return {
  {
    -- https://github.com/MeanderingProgrammer/render-markdown.nvim
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      render_modes = true,
      preset = "lazy", -- will attempt to stay up to date with LazyVim configuration
      latex = { enabled = false },
    },
  },
  { -- markdown keybinds
    -- https://github.com/antonk52/markdowny.nvim
    "antonk52/markdowny.nvim",
    event = "VeryLazy",
    opts = {
      filetypes = { "markdown", "gitcommit", "hgcommit" },
    },
  },
}
