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
  -- --| visual stuff |--------------------------------------------------------------------------------------------------
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
  --[[
  { -- dim code outside current scope or something
    -- https://github.com/folke/twilight.nvim
    "folke/twilight.nvim",
    -- stylua: ignore
    opts = {
      dimming = {
        alpha = 0.80, -- dim to this amount
        -- we try to get the foreground from the highlight groups or fallback color
        color = { "Normal", "#ffffff" },
        term_bg = "#000000", -- if guibg=NONE, this will be used to calculate text color
        inactive = false,    -- when true, other windows will be fully dimmed (unless they contain the same buffer)
      },
      context = 10, -- amount of lines we will try to show around the current line
      expand = {    -- for treesitter, we we always try to expand to the top-most ancestor with these types
        "function",
        "method",
        "table",
        "if_statement",
      },
    },
  },
  --]]
}
