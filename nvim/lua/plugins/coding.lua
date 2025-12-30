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
  -- --| templates |---------------------------------------------------------------------------------------------------
  {
    -- https://github.com/cvigilv/esqueleto.nvim
    "cvigilv/esqueleto.nvim",
    dependencies = { "dressing.nvim" },
    -- event = { "BufNewFile" },
    -- ---@type Esqueleto.Config
    --[[ USAGE:
    --    mkdir <filename>
    --    ln -s $(pwd)/<template-filetype-dir>/<desired-template-filename> $(pwd)/<filename>
    --    ???????
    --]]
    opts = {
      directories = { vim.fn.stdpath "config" .. "/templates" }, -- template directory
      patterns = {
        -- file names
        "LICENSE",
        -- filetypes
        "c",
        "cpp",
        -- "python",
        "bash",
        -- "yaml"
      },
      --[[
      wildcards = {
        lookup = { -- wild-cards look-up table
          -- for reference
          -- --| file operations |----------------------------------------------------------------------------------
          "filename"
            return vim.fn.expand "%:t:r"
          "fileabspath"
            return vim.fn.expand "%:p"
          "filerelpath"
            return vim.fn.expand "%:p:~"
          "fileext"
            return vim.fn.expand "%:e"
          "filetype"
            return vim.bo.filetype

          -- --| date |----------------------------------------------------------------------------------------------
          "date"
            return os.date("%Y%m%d", os.time())
          "year"
            return os.date("%Y", os.time())
          "month"
            return os.date("%m", os.time())
          "day"
            return os.date("%d", os.time())
          "time"
          return os.date("%T", os.time())
        },
      },
      advanced = {
        ignored = {},
        ignore_os_files = true,
        ignore_patterns = { "^/tmp", ".bak$" },
      },
      --]]
      -- },
    },
  },
}
