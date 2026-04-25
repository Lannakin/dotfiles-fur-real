-- /plugins/coding.lua
-- disabled if below line is active
-- if true then return {} end

-- [ v for mini.surround v ] --
-- vim.keymap.set({ "n", "x" }, "s", "<Nop>")
vim.o.timeoutlen = 3000 -- increase timeout b/c slow
-- [ ^ for mini.surround ^ ] --

---@type LazySpec
return {
  {
    -- https://github.com/nvim-mini/mini.surround"
    "nvim-mini/mini.surround",
    opts = {
      -- stylua: ignore
      mappings = {
        add = "sa",            -- Add surrounding in Normal and Visual modes - removed
        delete = "sd",         -- Delete surrounding
        find = "",           -- Find surrounding (to the right)
        find_left = "",      -- Find surrounding (to the left)
        highlight = "",      -- Highlight surrounding
        replace = "sr",        -- Replace surrounding
        update_n_lines = "",   -- Update `n_lines`
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
  { -- use treesitter to autoclose and autorename html tag
    -- https://github.com/windwp/nvim-ts-autotag
    "windwp/nvim-ts-autotag",
    opts = {},
  },
}
