-- /plugins/editor.lua
-- disabled if below line is active
-- if true then return {} end

return {
  { -- IDE-like navigation top bar
    -- https://github.com/Bekaboo/dropbar.nvim
    "Bekaboo/dropbar.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    config = function()
      local dropbar_api = require "dropbar.api"
      local map = vim.keymap.set
      map("n", "<Leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
      map("n", "[;", dropbar_api.goto_context_start, { desc = "Go to start of current context" })
      map("n", "];", dropbar_api.select_next_context, { desc = "Select next context" })
    end,
  },
  { -- replaces default neovim matchparen because it stopped working for me
    -- https://github.com/monkoose/matchparen.nvim
    "monkoose/matchparen.nvim",
    opts = {
      -- Set to `false` to disable at matchpren at startup
      -- Enable matchparen manually with `:MatchParenEnable`
      enabled = true,
      -- Highlight group of the matched brackets
      -- Change it to any other or adjust colors of "MathParen" highlight group
      -- in your colorscheme to your liking
      hl_group = "MatchParen",
      -- Debounce time in milliseconds for rehighlighting brackets
      -- Set to 0 to disable debouncing
      debounce_time = 60,
    },
  },
  { -- customizable statuscolumn
    -- https://github.com/luukvbaal/statuscol.nvim
    "luukvbaal/statuscol.nvim",
    opts = function()
      local builtin = require "statuscol.builtin"

      return {
        setopt = true, -- Whether to set the 'statuscolumn' option, may be set to false for CONTROL FREAKS
        thousands = false, -- or line number thousands separator string ("." / ",")
        relculright = false, -- whether to right-align the cursor line number with 'relativenumber' set

        -- Builtin 'statuscolumn' options
        ft_ignore = nil, -- Lua table with 'filetype' values for which 'statuscolumn' will be unset
        bt_ignore = nil, -- Lua table with 'buftype' values for which 'statuscolumn' will be unset

        -- Default segments (fold -> sign -> line number + separator), explained below
        segments = {
          { text = { "%C" }, click = "v:lua.ScFa" },
          { text = { "%s" }, click = "v:lua.ScSa" },
          {
            text = { builtin.lnumfunc, " " },
            condition = { true, builtin.not_empty },
            click = "v:lua.ScLa",
          },
        },

        clickmod = "c", -- modifier used for certain actions in the builtin clickhandlers:

        clickhandlers = { -- builtin click handlers, keys are pattern matched
          Lnum = builtin.lnum_click,

          FoldClose = builtin.foldclose_click,
          FoldOpen = builtin.foldopen_click,
          FoldOther = builtin.foldother_click,

          DapBreakpointRejected = builtin.toggle_breakpoint,
          DapBreakpoint = builtin.toggle_breakpoint,
          DapBreakpointCondition = builtin.toggle_breakpoint,

          ["diagnostic/signs"] = builtin.diagnostic_click,
          gitsigns = builtin.gitsigns_click,
        },
      }
    end,
  },
  { -- scrollbar because i am lost without it
    -- https://github.com/lewis6991/satellite.nvim
    "lewis6991/satellite.nvim",
    opts = {
      current_only = false,
      winblend = 50,
      zindex = 40,
      excluded_filetypes = {},
      width = 3,
      handlers = {
        cursor = {
          enable = true,
          symbols = { "⎺", "⎻", "⎼", "⎽" },
        },
        search = {
          enable = true,
        },
        diagnostic = {
          enable = true,
          signs = { "-", "=", "≡" },
          min_severity = vim.diagnostic.severity.HINT,
        },
        gitsigns = {
          enable = true,
          signs = { -- can only be a single character (multibyte is okay)
            add = "+",
            change = "=",
            delete = "-",
          },
        },
        marks = {
          enable = true,
          show_builtins = true, -- shows the builtin marks like [ ] < >
          key = "m",
        },
        quickfix = {
          signs = { "-", "=", "≡" },
        },
      },
    },
  },
  { -- highlights cursormode and cursorline
    -- https://github.com/ya2s/nvim-cursorline
    "ya2s/nvim-cursorline",
    opts = {
      cursorline = {
        enable = true,
        timeout = 1000,
        number = false,
      },
      cursorword = {
        enable = true,
        min_length = 3,
        hl = { underline = true },
      },
    },
  },
}
