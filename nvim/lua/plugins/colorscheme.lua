-- /plugins/colorscheme.lua
-- disabled if below line is active
-- if true then return {} end

---@type LazyPluginSpec[]
return {
  {
    -- https://github.com/EdenEast/nightfox.nvim
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    -- https://github.com/rebelot/kanagawa.nvim
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    -- https://github.com/sainnhe/gruvbox-material
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd [[ colorscheme gruvbox-material ]]
      -- vim.g.gruvbox_material_enable_italic = true
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
    end,
  },
  {
    -- https://github.com/svrana/neosolarized.nvim
    "svrana/neosolarized.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("neosolarized").setup {
        comment_italics = true,
        background_set = false,
      }
      vim.cmd.colorscheme "neosolarized"
    end,
    dependencies = {
      "tjdevries/colorbuddy.nvim",
    },
  },
-- --- ⚠️ cat themes ahead ⚠️ -----------------------------------------------------
  {
    -- https://github.com/Lannakin/cat-neosolarized.nvim
    "Lannakin/cat-neosolarized.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    opts = {
      style = "light",
      transparent = false,
      enable_italics = false,
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
        functions = { bold = false },
        variables = {},
        string = { italic = false },
      },
      config = function()
        vim.cmd [[ colorscheme cat-neosolarized ]]
      end,
    },
  },

  -- Configure LazyVim to load preferred colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "cat-neosolarized",
    },
  },
}
