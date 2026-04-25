-- /plugins/keymap-info.lua
-- disabled if below line is active
-- if true then return {} end

---@type LazySpec
return {
  {
    -- https://github.com/doctorfree/cheatsheet.nvim
    "doctorfree/cheatsheet.nvim",
    event = "VeryLazy",
    dependencies = { -- idk if these need to be loaded or not
      { "nvim-telescope/telescope.nvim" },
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
    },
    config = function()
      local ctactions = require "cheatsheet.telescope.actions"
      require("cheatsheet").setup {
        bundled_cheatsheets = {
          enabled = { "default", "lua", "markdown", "regex", "netrw", "unicode" },
          disabled = { "nerd-fonts" },
        },
        bundled_plugin_cheatsheets = {
          enabled = {
            "auto-session",
            "goto-preview",
            "lua",
            "octo.nvim",
            "telescope.nvim",
            "vim-easy-align",
            "vim-sandwich",
          },
          disabled = { "gitsigns" },
        },
        include_only_installed_plugins = true,
        telescope_mappings = {
          ["<CR>"] = ctactions.select_or_fill_commandline,
          ["<A-CR>"] = ctactions.select_or_execute,
          ["<C-Y>"] = ctactions.copy_cheat_value,
          ["<C-E>"] = ctactions.edit_user_cheatsheet,
        },
      }
    end,
  },
  {
    -- https://github.com/folke/which-key.nvim
    "folke/which-key.nvim",
    -- event = "VeryLazy",
    opts = function()
      return {
        ---@type false | "classic" | "modern" | "helix"
        preset = "classic",
        win = {
          border = "single",
          relative = "win",
          focusable = "false",
          noautocmd = "true",
          style = "minimal",
        },
        spec = {
          mode = { "n", "x" },
          { "<leader><tab>", group = "tabs" },
          { "<leader>B", group = "buffer" },
          { "<leader>d", group = "debug" },
          { "<leader>x", group = "diagnostics/quickfix" },
          -- { "<leader>F", group = "find" },
          { "<leader>g", group = "git" },
          { "<leader>l", group = "lsp" },
          { "<leader>P", group = "profiler" },
          { "<leader>S", group = "search" },
          { "<leader>u", group = "ui" },

          { "[", group = "prev" },
          { "]", group = "next" },
          { "g", group = "goto" },
          { "s", group = "surround" },
          { "z", group = "fold" },
        },
      }
    end,
    --[[
    --]]
    ---@diagnostic disable: missing-fields
    config = function(_, opts)
      require("which-key").setup(opts)
    end,
  },
}

