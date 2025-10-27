-- /plugins/lsp/lspsaga.lua
-- disabled if below line is active
-- if true then return {} end
-- https://github.com/nvimdev/lspsaga.nvim
return {
  "nvimdev/lspsaga.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",  -- optional
    "nvim-tree/nvim-web-devicons",      -- optional
  },
  cmd = "Lspsaga",
  opts = {},
  config = function(_, opts)
    require("lspsaga").setup(opts)
  end,
}

--[[ require('lazy').setup({
    'nvimdev/lspsaga.nvim',
    config = function()
        require('lspsaga').setup({})
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons',     -- optional
    }
}) --]]
