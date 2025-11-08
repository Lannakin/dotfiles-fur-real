-- /plugins/colorscheme.lua
-- disabled if below line is active
-- if true then return {} end

---@type LazySpec
return {
  {
    -- https://github.com/EdenEast/nightfox.nvim
    "EdenEast/nightfox.nvim",
    opts = {
      options = {
        -- Compiled file's destination location
        compile_path = vim.fn.stdpath("cache") .. "/nightfox",
        compile_file_suffix = "_compiled", -- Compiled file suffix
        transparent = false,     -- Disable setting background
        terminal_colors = true,  -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
        dim_inactive = false,    -- Non focused panes set to alternative background
        module_default = true,   -- Default enable value for modules
        styles = {               -- Style to be applied to different syntax groups
          comments = "NONE",     -- Value is any valid attr-list value `:help attr-list`
          conditionals = "NONE",
          constants = "NONE",
          functions = "NONE",
          keywords = "NONE",
          numbers = "NONE",
          operators = "NONE",
          strings = "NONE",
          types = "NONE",
          variables = "NONE",
        },
        inverse = {             -- Inverse highlight for different types
          match_paren = false,
          visual = false,
          search = false,
        },
        modules = {             -- List of various plugins and additional options
          -- ...
        },
      },
    palettes = {},
    specs = {},
    groups = {},
    },
  },
  -- https://github.com/rebelot/kanagawa.nvim
  { "rebelot/kanagawa.nvim" },
  -- https://github.com/sainnhe/gruvbox-material
  { "sainnhe/gruvbox-material" },
  {
    -- https://github.com/svrana/neosolarized.nvim
    "svrana/neosolarized.nvim",
    opts = function()
      -- vim.cmd [[ colorscheme neosolarized ]]
      return {
        comment_italics = true,
        background_set = false,
      }
    end,
    dependencies = {
      "tjdevries/colorbuddy.nvim",
    },
  },
-- --- ⚠️ cat themes ahead ⚠️ -----------------------------------------------------
  {
    -- https://github.com/Lannakin/cat-neosolarized.nvim
    "Lannakin/cat-neosolarized.nvim",
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
        -- vim.cmd [[ colorscheme cat-neosolarized ]]
      }
    -- end
  },
  -- Configure LazyVim to load preferred colorscheme
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "cat-neosolarized" },
  },
}
