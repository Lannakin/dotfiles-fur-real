-- /plugins/render-markdown.lua
-- disabled if below line is active
-- if true then return {} end
return {
  {
    -- https://github.com/MeanderingProgrammer/render-markdown.nvim
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      ft = { "markdown", "quarto" },
      render_modes = true,
      preset = "lazy",  -- will attempt to stay up to date with LazyVim configuration
      latex = { enabled = false },
    },
    --[[ config = function(_, opts)
      require("render-markdown").setup(opts)
    end, --]]
  },
}
