-- /plugins/keymap-info.lua
-- disabled if below line is active
-- if true then return {} end

---@type LazyPluginSpec[]
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
        preset = "helix",
        win = {
          border = "single",
          relative = "win",
          focusable = "false",
          noautocmd = "true",
          style = "minimal",
        },
        spec = {
          mode = { "n", "x" },
          { "<leader>B", group = "buffer" },
          -- { "<leader>l", group = "lsp" },
          { "<leader>G", group = "git" },
          { "s", group = "surround" },
          { "<leader>S", group = "search" },
          { "<leader>P", group = "profiler" },
        },
      }
    end,
    config = function(_, opts)
      require("which-key").setup(opts)
    end,
  },
}

