-- /plugins/cheatsheets.lua
-- disabled if below line is active
-- if true then return {} end
return {
  {
    -- https://github.com/doctorfree/cheatsheet.nvim
    "doctorfree/cheatsheet.nvim",
    event = "VeryLazy",
    dependencies = {
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
    event = "VeryLazy",
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
          { "<leader>s", group = "surround" },
          { "<leader>G", group = "git" },
          { "<leader>S", group = "search" },
        },
      }
    end,
    config = function(_, opts)
      require("which-key").setup(opts)
    end,
  },
}
