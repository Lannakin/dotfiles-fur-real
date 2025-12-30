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
    --[[
    config = function()
      -- Load Arduino plugin for .ino files
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "arduino",
        callback = function()
          require "Arduino-Nvim"
        end,
      })
    end,
    --]]
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
    -- optional: cond used to enable/disable platformio
    -- based on existance of platformio.ini file and .pio folder in cwd.
    -- You can enable platformio plugin, using :Pioinit command
    cond = function()
      -- local platformioRootDir = vim.fs.root(vim.fn.getcwd(), { 'platformio.ini' }) -- cwd and parents
      local platformioRootDir = (vim.fn.filereadable "platformio.ini" == 1) and vim.fn.getcwd() or nil
      if platformioRootDir then
        -- if platformio.ini file exist in cwd, enable plugin to install plugin (if not istalled) and load it.
        vim.g.platformioRootDir = platformioRootDir
      elseif (vim.uv).fs_stat(vim.fn.stdpath "data" .. "/lazy/nvim-platformio.lua") == nil then
        -- if nvim-platformio not installed, enable plugin to install it first time
        vim.g.platformioRootDir = vim.fn.getcwd()
      else -- if nvim-platformio.lua installed but disabled, create Pioinit command
        vim.api.nvim_create_user_command("Pioinit", function() --available only if no platformio.ini and .pio in cwd
          vim.api.nvim_create_autocmd("User", {
            pattern = { "LazyRestore", "LazyLoad" },
            once = true,
            callback = function(args)
              if args.match == "LazyRestore" then
                require("lazy").load { plugins = { "nvim-platformio.lua" } }
              elseif args.match == "LazyLoad" then
                local pio_install_status = require("platformio.utils").pio_install_check()
                if not pio_install_status then
                  return
                end
                vim.notify("PlatformIO loaded", vim.log.levels.INFO, { title = "PlatformIO" })
                require("platformio").setup(vim.g.pioConfig)
                vim.cmd "Pioinit"
              end
            end,
          })
          vim.g.platformioRootDir = vim.fn.getcwd()
          require("lazy").restore { plguins = { "nvim-platformio.lua" }, show = false }
        end, {})
      end
      return vim.g.platformioRootDir ~= nil
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
