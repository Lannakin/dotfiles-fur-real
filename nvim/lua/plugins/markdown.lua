-- /plugins/render-markdown.lua
-- disabled if below line is active
-- if true then return {} end
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

      -- To apply the keymaps to specific filetypes, use autocmd:
      --[[
      vim.api.nvim_create_autocmd('FileType', {
          desc = 'markdowny.nvim keymaps',
          pattern = { 'markdown' },
          callback = function()
              -- add custom keymaps here
          end,
      })
      --]]
    },
  },
  --[[ {
    -- https://github.com/OXY2DEV/markview.nvim
    "OXY2DEV/markview.nvim",
    lazy = false,

    -- For blink.cmp's completion
    -- source
    dependencies = {
        "saghen/blink.cmp"
    },
  }, --]]
}
