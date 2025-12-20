-- /plugins/coding.lua
-- disabled if below line is active
-- if true then return {} end
---@module 'lazy'

-- [ v for mini.surround v ] --
-- vim.keymap.set({ "n", "x" }, "s", "<Nop>")
vim.o.timeoutlen = 3000 -- increase timeout b/c slow
-- [ ^ for mini.surround ^ ] --

---@type LazySpec
return {
  { -- used by LSPs
    -- https://github.com/nvim-treesitter/nvim-treesitter-context
    "nvim-treesitter/nvim-treesitter-context",
    event = "LazyFile",
    opts = function()
      -- local tsc = require "treesitter-context"
      return { mode = "cursor", max_lines = 3 }
    end,
  },
  {
    -- https://github.com/nvim-mini/mini.surround"
    "nvim-mini/mini.surround",
    opts = {
      -- stylua: ignore
      mappings = {
        add = "sa",            -- Add surrounding in Normal and Visual modes - removed
        delete = "sd",         -- Delete surrounding
        find = "sf",           -- Find surrounding (to the right)
        find_left = "sF",      -- Find surrounding (to the left)
        highlight = "sh",      -- Highlight surrounding
        replace = "sr",        -- Replace surrounding
        update_n_lines = "sn", -- Update `n_lines`
      },
    },
  },
  -- --| syntax additions |--------------------------------------------------------------------------------------------
  { -- syntax highlighting for kitty config files
    -- https://github.com/fladson/vim-kitty
    "fladson/vim-kitty",
    ft = "kitty",
  },
  -- --| visual stuff |------------------------------------------------------------------------------------------------
  { -- highlights text when undoing
    "tzachar/highlight-undo.nvim",
    opts = {
      hlgroup = "HighlightUndo",
      duration = 300,
      pattern = { "*" },
      ignored_filetypes = { "neo-tree", "fugitive", "TelescopePrompt", "mason", "lazy" },
    },
  },
  {
    -- https://github.com/lukas-reineke/indent-blankline.nvim
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    version = false,
    ---@module "ibl"
    ---@type ibl.config
    opts = {
      enabled = true,
      debounce = 200,
      indent = {
        repeat_linebreak = vim.o.bri and vim.o.briopt ~= "",
        smart_indent_cap = false,
        char = { "┆" }, -- ┆ ┇ ┊ ╎ •
        -- tab_char = { '▏', '▎', '▍', '▌', '▋', '▊', '▉', '█' },
      },
      scope = {
        enabled = true,
        char = { "╎" },
      },
      whitespace = {
        highlight = { "Whitespace", "NonText" },
        remove_blankline_trail = false,
      },
    },
  },
  {
    -- https://github.com/otavioschwanck/new-file-template.nvim
    "otavioschwanck/new-file-template.nvim",
    enabled = false,
    opts = {
      disable_insert = false,  -- Enter in insert mode after inserting the template?,
      disable_autocmd = false, -- Disable the autocmd that creates the template.  You can use manually by calling :InsertTemplateFile,
      disable_filetype = {},   -- Disable templates for a filetype (disable only default templates.  User templates will work).
      disable_specific = {},   -- Disable specific regexp for the default templates.
                               --   Example: { ruby = { ".*" } }.
      suffix_as_filetype = false, -- use suffix of filename rather than vim.bo.filetype as filetype
    },
  },
}
