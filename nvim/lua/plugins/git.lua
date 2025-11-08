-- /plugins/git.lua
-- disabled if below line is active
-- if true then return {} end
-- disabled until set up
return {
  {
    -- https://github.com/lewis6991/gitsigns.nvim
    "lewis6991/gitsigns.nvim",
    enabled = true,
    opts = function()
      return {
        signs = {
          add = { text = "+" },
          change = { text = "=" },
          delete = { text = "-" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
          untracked = { text = "┆" },
        },
        signs_staged = {
          add = { text = "+" },
          change = { text = "=" },
          delete = { text = "-" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
          untracked = { text = "┆" },
        },
        -- stylua: ignore start
        signs_staged_enable = false,
        signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
        numhl = false,      -- Toggle with `:Gitsigns toggle_numhl`
        linehl = false,     -- Toggle with `:Gitsigns toggle_linehl`
        word_diff = false,  -- Toggle with `:Gitsigns toggle_word_diff`
        -- stylua: ignore end
        watch_gitdir = {
          follow_files = true,
        },
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
        wrap = "hard", ---@type "hard"|"soft"|"none"
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
        confirmationSound = true, -- currently macOS only, PRs welcome

        -- If pushed commits contain references to issues, open them in the browser
        -- (not used when force-pushing).
        openReferencedIssues = false,
      },

      history = {
        autoUnshallowIfNeeded = false,
        diffPopup = {
          width = 0.8, -- between 0-1
          height = 0.8,
          border = "single", -- `vim.o.winborder` on nvim 0.11, otherwise "rounded"
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
    opts = {},
  },
}
