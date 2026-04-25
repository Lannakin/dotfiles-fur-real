-- ./nvim/lua/plugins/embedded.lua
-- disabled if below line is active
-- if true then return {} end

local key_opts = { silent = true }

---@type LazySpec
return {
  -- --| arduino |-----------------------------------------------------------------------------------------------------
  {
    -- https://github.com/yuukiflow/Arduino-Nvim
    "yuukiflow/Arduino-Nvim",
    -- lazy = false,
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {},
    -- stylua: ignore
    keys = {
      { "<Leader>au", ":InoUpload<CR>",       desc ="Upload arduino code", key_opts },
      { "<Leader>ac", ":InoCheck<CR>",        desc ="Compile and check arduino code", key_opts },
      { "<Leader>as", ":InoStatus<CR>",       desc ="Show arduino board and port status", key_opts },
      { "<Leader>ag", ":InoGUI<CR>",          desc ="Select arduino board and port GUI", key_opts },
      { "<Leader>am", ":InoMonitor<CR>",      desc ="Open serial monitor with default settings", key_opts },
      { "<Leader>al", ":InoLib<CR>",          desc ="Open arduino library manager", key_opts },
      { "<Leader>ab", ":InoSelectBoard<CR>",  desc ="Select arduino board", key_opts },
      { "<Leader>ap", ":InoSelectPort<CR>",   desc ="Select arduino port", key_opts },

      -- Upload with manual reset for UNO R4 WiFi
      -- { "<Leader>ar", ":InoUploadReset<CR>",  desc ="Upload arduino code with manual reset", { silent = true },
    },
    config = function()
      -- Load Arduino plugin for .ino files
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "arduino" },
        callback = function()
          require "Arduino-Nvim"
        end,
      })
    end,
  },
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>a", group = "arduino" },
      },
    },
  },
  -- --| platformio |--------------------------------------------------------------------------------------------------
  { -- platformio wrapper for nvim
    -- https://github.com/anurag3301/nvim-platformio.lua
    "anurag3301/nvim-platformio.lua",
    dependencies = {
      { "akinsho/toggleterm.nvim" },
      { "nvim-telescope/telescope.nvim" },
      { "nvim-telescope/telescope-ui-select.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "folke/which-key.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
    opts = function()
      vim.g.pioConfig = {
        lsp = "clangd",          -- value: clangd | ccls
        menu_key = "<leader>\\", -- replace this menu key  to your convenience
        debug = false,           -- enable debug messages
        clangd_source = "ccls",  -- value: ccls | compiledb, For detailed explation check :help platformio-clangd_source
      }
    end
  },
  -- --| stm32 lsp support |-------------------------------------------------------------------------------------------
  {
    "alex-schulster/stm_lsp_nvim",
    config = function()
      require("stm_lsp_nvim").setup {
        -- Custom configuration, or leave empty for default config
      }
    end,
  },
  -- --| toggleterm |--------------------------------------------------------------------------------------------------
  {
    -- https://github.com/akinsho/toggleterm.nvim
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = { { shade_terminals = false } },
  },
}
