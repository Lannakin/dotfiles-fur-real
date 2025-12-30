-- ./plugins/ai-code-hell.lua
-- disabled if below line is active
if true then return {} end
-- src: https://github.com/Gentleman-Programming/Gentleman.Dots/blob/main/GentlemanNvim/nvim/lua/plugins/claude-code.lua

---@type LazySpec
return {
  {
    "coder/claudecode.nvim",
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
  {
    "copilotlsp-nvim/copilot-lsp",
    init = function()
      vim.g.copilot_nes_debounce = 500
      vim.lsp.enable "copilot_ls"
      vim.keymap.set("n", "<tab>", function()
        local bufnr = vim.api.nvim_get_current_buf()
        local state = vim.b[bufnr].nes_state
        if state then
          -- Try to jump to the start of the suggestion edit.
          -- If already at the start, then apply the pending suggestion and jump to the end of the edit.
          local _ = require("copilot-lsp.nes").walk_cursor_start_edit()
            or (require("copilot-lsp.nes").apply_pending_nes() and require("copilot-lsp.nes").walk_cursor_end_edit())
          return nil
        else
          -- Resolving the terminal's inability to distinguish between `TAB` and `<C-i>` in normal mode
          return "<C-i>"
        end
      end, { desc = "Accept Copilot NES suggestion", expr = true })
    end,
  },
  {
    "TabbyML/vim-tabby",
    lazy = false,
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    init = function()
      vim.g.tabby_agent_start_command = {"npx", "tabby-agent", "--stdio"}
      vim.g.tabby_inline_completion_trigger = "auto"
    end,
  },
}
