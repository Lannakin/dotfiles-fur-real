-- /plugins/git.lua
-- disabled if below line is active
-- if true then return {} end

---@type LazySpec
return {
  {
    -- https://github.com/lewis6991/gitsigns.nvim
    "lewis6991/gitsigns.nvim",
    enabled = true,
    opts = function()
      return {
        -- stylua: ignore start
        signs = {
          add          = { text = "+" },
          change       = { text = "=" },
          delete       = { text = "-" },
          topdelete    = { text = "‾" },
          changedelete = { text = "~" },
          untracked    = { text = "┆" },
        },

        signs_staged = {
          add          = { text = "+" },
          change       = { text = "=" },
          delete       = { text = "-" },
          topdelete    = { text = "‾" },
          changedelete = { text = "~" },
          untracked    = { text = "┆" },
        },

        signs_staged_enable = false,
        signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
        numhl = false,     -- Toggle with `:Gitsigns toggle_numhl`
        linehl = false,    -- Toggle with `:Gitsigns toggle_linehl`
        word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
        -- stylua: ignore end
        watch_gitdir = { follow_files = true },
        auto_attach = true,
        attach_to_untracked = false,
        current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
      }
    end,
    config = function(_, opts)
      require("gitsigns").setup(opts)
    end,
  },
  { -- git browser that i might switch to over lazygit
    -- https://github.com/chrisgrieser/nvim-tinygit
    "chrisgrieser/nvim-tinygit",
    dependencies = "nvim-telescope/telescope.nvim",
    enabled = false,
    opts = {

      stage = { -- requires `telescope.nvim`
        contextSize = 1, -- larger values "merge" hunks. 0 is not supported.
        stagedIndicator = "󰐖",
        keymaps = { -- insert & normal mode
          stagingToggle = "<Space>",
          gotoHunk = "<CR>",
          resetHunk = "<C-r>",
        },

        moveToNextHunkOnStagingToggle = false,

        -- accepts the common telescope picker config
        telescopeOpts = {
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
              preview_width = 0.65,
              height = { 0.7, min = 20 },
            },
          },
        },
      },

      commit = {
        keepAbortedMsgSecs = 300,
        border = "single",
        spellcheck = false, -- vim's builtin spellcheck
        wrap = "hard",      ---@type "hard"|"soft"|"none"
        keymaps = {
          normal = { abort = "q", confirm = "<CR>" },
          insert = { confirm = "<C-CR>" },
        },

        subject = {
          -- automatically apply formatting to the subject line
          autoFormat = function(subject) ---@type nil|fun(subject: string): string
            subject = subject:gsub("%.$", "")
            return subject
          end,

          -- disallow commits that do not use an allowed type
          enforceType = false,
          -- stylua: ignore
          types = {
            "fix", "feat", "chore", "docs", "refactor", "build", "test",
            "perf", "style", "revert", "ci", "break",
          },
        },
      },

      push = {
        preventPushingFixupCommits = true,

        -- If pushed commits contain references to issues, open them in the browser
        -- (not used when force-pushing).
        openReferencedIssues = false,
      },

      history = {
        autoUnshallowIfNeeded = false,
        diffPopup = {
          width = 0.8, -- between 0-1
          height = 0.8,
          border = "single", -- `vim.o.winborder` on nvim 0.11
        },
      },

      appearance = {
        backdrop = {
          enabled = true,
          blend = 40, -- 0-100
        },
      },
    },
  },
  { -- newer fork
    -- https://github.com/3dyuval/diffview.nvim
    "3dyuval/diffview.nvim",
    cmd = { "DiffviewOpen" },
    opts = function()
      -- local Actions = require "diffview.actions"
      local min = math.min
      local floor = math.floor
      local nvim_set_option_value= vim.api.nvim_set_option_value

      return {
        diff_binaries = false,
        enhanced_diff_hl = true,
        use_icons = true,
        show_help_hints = true,
        watch_index = true,
        git_cmd = { "git" },
        hg_cmd = { "hg" },
        icons = { folder_closed = "", folder_open = "" },
        signs = { fold_closed = "", fold_open = "", done = "✓" },
        view = {
          default = {
            layout = "diff2_horizontal", ---@type DiffView.Views
            winbar_info = true,
          },
          merge_tool = {
            layout = "diff3_horizontal", ---@type DiffView.Views
            disable_diagnostics = true,
            winbar_info = true,
          },
          file_history = {
            layout = "diff2_horizontal", ---@type DiffView.Views
            winbar_info = true,
          },
        },
        file_panel = {
          listing_style = "list",        ---@type DiffView.ListStyle
          tree_options = {
            flatten_dirs = true,
            folder_statuses = "always",  ---@type 'never'|'only_folded'|'always'
          },
          win_config = function()
            local tab = vim.api.nvim_get_current_tabpage()
            return {
              type = "split",
              position = "left",
              width = 25,
              height = 20,
              relative = "win",
              win = vim.api.nvim_tabpage_list_wins(tab)[1],
              win_opts = {
                number = false,
                wrap = true,
                relativenumber = false,
                signcolumn = "no",
                cursorline = true,
              },
            }
          end,
        },
        file_history_panel = {
          log_options = {
            git = {
              single_file = { diff_merges = "combined" },
              multi_file = { diff_merges = "first-parent" },
            },
          },
          win_config = function()
            local c = { width = vim.o.columns, height = vim.o.lines }
            return {
              position = "bottom",
              width = min(100, c.width),
              height = min(24, c.height),
              col = floor(vim.o.columns * 0.5 - c.width * 0.5),
              row = floor(vim.o.lines * 0.5 - c.height * 0.5),
              win_opts = {
                number = false,
                wrap = false,
                relativenumber = false,
                signcolumn = "no",
                cursorline = true,
              },
            }
          end,
        },
        commit_log_panel = {
          win_config = function()
            local c = { width = vim.o.columns, height = vim.o.lines }
            return {
              position = "bottom",
              width = min(100, c.width),
              height = min(24, c.height),
              col = floor(vim.o.columns * 0.5 - c.width * 0.5),
              row = floor(vim.o.lines * 0.5 - c.height * 0.5),
              win_opts = {
                number = false,
                wrap = false,
                relativenumber = false,
                signcolumn = "no",
                cursorline = true,
              },
            }
          end,
        },
        default_args = { DiffviewOpen = {}, DiffviewFileHistory = {} },
        hooks = {
          diff_buf_read = function(_)
            nvim_set_option_value("wrap", true, { scope = "local" })
            nvim_set_option_value("list", true, { scope = "local" })
            nvim_set_option_value("colorcolumn", "120", { scope = "local" })
          end,
          view_opened = function(view)
            vim.notify(("A new %s was opened on tab page %d!"):format(view.class:name(), view.tabpage))
          end,
        },
      }
    end,
  },
}
