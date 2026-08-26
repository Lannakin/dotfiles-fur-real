-- ./plugins/ai-code-hell.lua
-- disabled if below line is active
if true then return {} end
-- src: https://github.com/Gentleman-Programming/Gentleman.Dots/blob/main/GentlemanNvim/nvim/lua/plugins/claude-code.lua

---@type LazySpec
return {
  --[[
  {
    "coder/claudecode.nvim",
    enabled = false,
    dependencies = { "folke/snacks.nvim" },
    opts = {
      terminal = {
        split_side = "right",
        split_width_percentage = 0.30,
        provider = "snacks",
      },
    },
    keys = {
      -- { "<leader>a", nil, desc = "AI/Claude Code" },
      -- { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
      -- { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
      -- { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
      -- { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
      -- { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
      -- { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
      -- { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
      -- {
      --   "<leader>as",
      --   "<cmd>ClaudeCodeTreeAdd<cr>",
      --   desc = "Add file",
      --   ft = { "NvimTree", "neo-tree", "oil", "minifiles" },
      -- },
      -- -- Diff management
      -- { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
      -- { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
      -- -- Preserved existing keymaps
      -- { "<leader>at", "<cmd>ClaudeCodeContinue<cr>", desc = "Continue recent conversation" },
      -- { "<leader>av", "<cmd>ClaudeCodeVerbose<cr>", desc = "Verbose logging" },
    },
  },
  --]]
  --[[
  {
    -- https://github.com/zbirenbaum/copilot.lua
    "zbirenbaum/copilot.lua",
    opts = { telemetry = { telemetryLevel = "off" } },
    enabled = true,
  },
  --]]
  --[[
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- LazyVim Extra disabled it for copilot.lua
        copilot = {
          enabled = false,
          settings = { telemetry = { telemetryLevel = "off" } },
        },
      },
    },
  },
  --]]
  --[[
  {
    "mason-org/mason.nvim",
    -- https://github.com/copilotlsp-nvim/copilot-lsp
    opts = { ensure_installed = { "copilot-language-server" } },
  },
  --]]
  --[[
  {
    -- https://github.com/Saghen/blink.cmp
    "saghen/blink.cmp",
    optional = true,
    dependencies = { "fang2hou/blink-copilot" },
    opts = {
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "copilot" },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-copilot",
            score_offset = 100,
            async = true,
          },
        },
      },
    },
  },
  --]]
  --[[
  {
    -- https://github.com/fang2hou/blink-copilot
    "fang2hou/blink-copilot",
    -- stylua: ignore 
    opts = {
      max_completions = 3,
      max_attempts = 4,
      kind_name = "Copilot",
      kind_icon = " ",
      kind_hl = false,
      debounce = 200,
      auto_refresh = {
        backward = true,
        forward = true,
      },
    },
  },
  --]]
  {
    -- https://github.com/TabbyML/vim-tabby
    "TabbyML/vim-tabby",
    lazy = false,
    enabled = false,
    dependencies = { "neovim/nvim-lspconfig" },
    init = function()
      vim.g.tabby_agent_start_command = { "npx", "tabby-agent", "--stdio" }
      vim.g.tabby_inline_completion_trigger = "auto"
    end,
  },
}
