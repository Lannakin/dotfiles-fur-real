-- /plugins/editor.lua
-- disabled if below line is active
-- if true then return {} end
---@module 'lazy'

local excluded_filetypes = { "neo-tree", "alpha", "Outline", "edgy", "floaterm" }

---@type LazySpec
return {
  -- --| neovim function |---------------------------------------------------------------------------------------------
  { -- write file with root privs
    -- https://github.com/lambdalisue/vim-suda
    "lambdalisue/vim-suda",
    cmd = { "SudaRead", "SudaWrite" },
  },
  -- --| ui edits: function |------------------------------------------------------------------------------------------
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
      -- in your colorscheme to your likin    hl_group = "MatchParen",
      -- Debounce time in milliseconds for rehighlighting brackets
      -- Set to 0 to disable debouncing
      debounce_time = 60,
    },
  },
  { -- browse github for repos tagged neovim-plugin
    -- https://github.com/alex-popov-tech/store.nvim
    "alex-popov-tech/store.nvim",
    dependencies = { "OXY2DEV/markview.nvim" },
    opts = {},
    cmd = "Store",
  },
  --[[
  { -- open github repo links etc via placing cursor over + (visual mode) typing gx
    -- https://github.com/chrishrb/gx.nvim
    "chrishrb/gx.nvim",
    dependencies = { "nvim-lua/plenary.nvim" }, -- Required for Neovim < 0.10.0
    keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
    cmd = { "Browse" },
    opts = {
      init = function()
        vim.g.netrw_nogx = 1 -- disable netrw gx
      end,
      -- config = true, -- default settings
      -- submodules = false, -- not needed, submodules are required only for tests

      -- you can specify also another config if you want
      config = function()
        require("gx").setup {
          open_browser_app = "os_specific", -- specify your browser app; default for macOS is "open", Linux "xdg-open"
                                            -- and Windows "powershell.exe"
          open_browser_args = { "--background" }, -- specify any arguments, such as --background for macOS' "open".

          open_callback = false,

          select_prompt = true, -- shows a prompt when multiple handlers match; disable to auto-select the top one

          handlers = {
            plugin = true, -- open plugin links in lua (e.g. packer, lazy, ..)
            github = true, -- open github issues
            brewfile = true, -- open Homebrew formulaes and casks
            package_json = true, -- open dependencies from package.json
            search = true, -- search the web/selection on the web if nothing else is found
            go = true, -- open pkg.go.dev from an import statement (uses treesitter)
            jira = { -- custom handler to open Jira tickets (these have higher precedence than builtin handlers)
              name = "jira", -- set name of handler
              handle = function(mode, line, _)
                local ticket = require("gx.helper").find(line, mode, "(%u+-%d+)")
                if ticket and #ticket < 20 then
                  return "http://jira.company.com/browse/" .. ticket
                end
              end,
            },
            rust = { -- custom handler to open rust's cargo packages
              name = "rust", -- set name of handler
              filetype = { "toml" }, -- you can also set the required filetype for this handler
              filename = "Cargo.toml", -- or the necessary filename
              handle = function(mode, line, _)
                local crate = require("gx.helper").find(line, mode, "(%w+)%s-=%s")

                if crate then
                  return "https://crates.io/crates/" .. crate
                end
              end,
            },
          },
          handler_options = {
            search_engine = "google", -- you can select between google, bing, duckduckgo, ecosia and yandex
            select_for_search = false, -- if your cursor is e.g. on a link, the pattern for the link AND for the word
                                       -- will always match. This disables this behaviour for default so that the link
                                       -- is opened without the select option for the word AND link

            git_remotes = { "upstream", "origin" }, -- list of git remotes to search for git issue linking, in priority
            git_remote_push = false, -- use the push url for git issue linking,
          },

      end,
    },
  },
  --]]
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
        ft_ignore = { "neo-tree", "neo-tree-popup", "alpha", "lazy", "mason", "dashboard" },
        segments = {
          {
            sign = {
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
          {
            text = { builtin.lnumfunc },
            condition = { true, builtin.not_empty },
            -- click = "v:lua.ScLa"
          },
          {
            sign = {
              namespace = { "gitsigns.*" },
              name = { "gitsigns.*" },
              maxwidth = 1,
              colwidth = 1,
              auto = true,
              fillchar = " ", -- "█",
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
    --https://github.com/stevearc/quicker.nvim
    "stevearc/quicker.nvim",
    ft = "qf",
    ---@module "quicker"
    ---@type quicker.SetupOptions
    opts = {},
  },
  { -- colorize color text
    -- https://github.com/catgoose/nvim-colorizer.lua
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = { user_default_options = { names = false } },
  },
}
