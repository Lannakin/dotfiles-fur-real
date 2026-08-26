-- /plugins/editor.lua
-- disabled if below line is active
-- if true then return {} end

local excluded_filetypes = { "neo-tree", "neo-tree-popup", "alpha", "floaterm", "Outline", "edgy", "lazy", "mason" }

---@type LazySpec
return {
  -- --| neovim function |---------------------------------------------------------------------------------------------
  { -- write file with root privs
    -- https://github.com/lambdalisue/vim-suda
    "lambdalisue/vim-suda",
    cmd = { "SudaRead", "SudaWrite" },
  },
  -- --| neovim behavior |---------------------------------------------------------------------------------------------
  { -- fuzzy incremental search to jump
    -- https://github.com/rlane/pounce.nvim
    "rlane/pounce.nvim",
    enabled = false,
    --[[
    local map = vim.keymap.set
    map("n", "s", function() require'pounce'.pounce { } end)
    map("n", "S", function() require'pounce'.pounce { do_repeat = true } end)
    map("x", "s", function() require'pounce'.pounce { } end)
    map("o", "gs", function() require'pounce'.pounce { } end)
    map("n", "S", function() require'pounce'.pounce { input = {reg="/"} } end)
    --]]
    --[[
    pounce commands:
      <cmd>PounceReg /<cr> " Pounce with last search pattern
      <cmd>PounceReg 0<cr> " Pounce with last yank
      <cmd>PounceReg \"<cr> " Pounce with last d/c/y
      <cmd>PounceReg .<cr> " Pounce with last inserted text
      \"zy<cmd>PounceReg z<cr> " From visual mode: Pounce using the selection as the input
      <cmd>PounceExpand <cword><cr> " Pounce with the current word
      <cmd>PounceExpand %<cr> " Pounce with the current filename
    --]]
  },
  -- {
  --   -- https://github.com/folke/flash.nvim
  --   "folke/flash.nvim",
  --   event = "VeryLazy",
  --   enabled = false,
  --   --[[
  --   --]]
  --   opts = {
  --     modes = {
  --       jump_labels = true,
  --       label = { exclude = --[["hjkliardc"]] "" },
  --       char = { enabled = false },
  --       -- remap via keys = { [";"] = "L", [","] = H }
  --       keys = {
  --       -- "f",
  --       -- "F",
  --       "t",
  --       "T",
  --       ";", -- next
  --       ",", -- previous
  --       },
  --     },
  --   },
  --   --[[
  --   config = function()
  --     return {
  --       char = { enabled = false },
  --     }
  --   end
  --   --]]
  -- },
  -- --| ui edits: function |------------------------------------------------------------------------------------------
  { -- IDE-like navigation top bar
    -- https://github.com/Bekaboo/dropbar.nvim
    "Bekaboo/dropbar.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  { -- replaces default neovim matchparen because it stopped working for me
    -- https://github.com/monkoose/matchparen.nvim
    "monkoose/matchparen.nvim",
    opts = {
      enabled = true,
      -- debounce_time = 60,
    },
  },
  -- --| ui edits: appearance |----------------------------------------------------------------------------------------
  { -- scrollbar
    -- https://github.com/dstein64/nvim-scrollview
    "dstein64/nvim-scrollview",
    event = "LazyFile",
    keys = { { "<leader>uV", "<cmd>ScrollViewToggle<CR>", desc = "Toggle Scrollview" } },
    config = function()
      require("scrollview").setup {
        excluded_filetypes = excluded_filetypes,
        signs_column = 0,
        winblend = 25,
        signs_on_startup = { "all" },
        diagnostics_error_symbol = "",
        diagnostics_warn_symbol = "W",
        diagnostics_info_symbol = "",
        diagnostics_hint_symbol = "",
      }
    end,
  },
  { -- highlights cursormode and cursorline
    -- https://github.com/ya2s/nvim-cursorline
    "ya2s/nvim-cursorline",
    opts = {
      cursorline = {
        enable = true,
        timeout = 500,
        number = false,
      },
      cursorword = {
        enable = true,
        min_length = 3,
        hl = { underline = true },
      },
    },
  },
  { -- screencast show pressed keys
    -- https://github.com/nvzone/showkeys
    "nvzone/showkeys",
    cmd = "ShowkeysToggle",
    opts = {
      timeout = 1,
      maxkeys = 5,
      -- more opts
    },
  },
  { -- customizable statuscolumn
    -- https://github.com/luukvbaal/statuscol.nvim
    "luukvbaal/statuscol.nvim",
    -- enable = false,
    -- src: https://github.com/Matt-FTW/dotfiles/blob/main/.config/nvim/lua/plugins/extras/ui/status-column.lua
    opts = function()
      local builtin = require "statuscol.builtin"
      return {
        setopt = true,
        ft_ignore = excluded_filetypes,
        segments = {
          {
            -- segments go from left to right
            sign = { -- diagnostic signs
              namespace = { "diagnostic.*" },
              text = { ".*" },
              -- condition = { true, builtin.not_empty },
              maxwidth = 1,
              colwidth = 1,
              auto = true,
              fillchar = " ", -- "█",
              fillcharhl = "LineNr",
              foldclosed = true,
            },
            click = "v:lua.ScSa",
          },
          { -- line numbers
            text = { builtin.lnumfunc },
            condition = { true, builtin.not_empty },
            -- click = "v:lua.ScLa"
          },
          {
            sign = { -- git signs
              namespace = { "gitsigns.*" },
              name = { "gitsigns.*" },
              maxwidth = 1,
              colwidth = 1,
              auto = true,
              fillchar = " ",
              fillcharhl = "LineNr",
            },
          },
        },
      }
    end,
    config = function(_, opts)
      require("statuscol").setup(opts)
    end,
  },
  { -- folding
    -- https://github.com/e-roux/pretty-fold.nvim
    "e-roux/pretty-fold.nvim",
    opts = {},
  },
  { -- quickfix gui
    -- https://github.com/stevearc/quicker.nvim
    "stevearc/quicker.nvim",
    ft = "qf",
    ---@module "quicker"
    opts = {
      buflisted = false,
      number = false,
      relativenumber = false,
      signcolumn = "auto",
      winfixheight = true,
      wrap = false,
      follow = {
        -- When quickfix window is open, scroll to closest item to the cursor
        enabled = false,
      },
      borders = {
        vert = "┃",
        -- Strong headers separate results from different files
        strong_header = "━",
        strong_cross = "╋",
        strong_end = "┫",
        -- Soft headers separate results within the same file
        soft_header = "╌",
        soft_cross = "╂",
        soft_end = "┨",
      },
    },
  },
  { -- colorize color text
    -- https://github.com/catgoose/nvim-colorizer.lua
    "catgoose/nvim-colorizer.lua",
    -- event = "VeryLazy",
    opts = {
      -- lazy_load = true,
      user_default_options = {
        names = false,
        -- Highlighting mode.  'background'|'foreground'|'virtualtext'
        mode = "virtualtext", -- Set the display mode
        -- Virtualtext character to use
        virtualtext = "■",
        -- Display virtualtext inline with color. true sets to 'after'
        virtualtext_inline = false,
        -- Virtualtext highlight mode: 'background'|'foreground'
        virtualtext_mode = "foreground",
      },
    },
  },
  { -- snacks image rendering
    -- https://github.com/folke/snacks.nvim/blob/main/docs/image.md
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      doc = {
        enabled = true,
        inline = true,
        max_width = 80,
        max_height = 40,
      },
      image = {
        img_dirs = { "img", "images", "assets", "static", "public", "media", "attachments" },
        wo = {
          wrap = false,
          number = false,
          relativenumber = false,
          cursorcolumn = false,
          signcolumn = "no",
          foldcolumn = "0",
          list = false,
          spell = false,
          statuscolumn = "",
        },

        convert = {
          notify = false, -- show a notification on error
          magick = {
            default = { "{src}[0]", "-scale", "1920x1080>" }, -- default for raster images
          },
          mermaid = function()
            local theme = vim.o.background == "light" and "neutral" or "dark"
            return { "-i", "{src}", "-o", "{file}", "-b", "transparent", "-t", theme, "-s", "{scale}" }
          end,
        },
      },
    },
  },
  { -- log syntax colorations
    -- https://github.com/fei6409/log-highlight.nvim
    "fei6409/log-highlight.nvim",
    opts = {},
  },
}
