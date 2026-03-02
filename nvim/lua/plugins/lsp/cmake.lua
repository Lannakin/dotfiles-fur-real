-- ./plugins/lsp/cmake.lua
-- disabled if below line is active
-- if true then return {} end

return {
  { -- Add cmake to treesitter
    -- https://github.com/nvim-treesitter/nvim-treesitter
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "cmake" } },
  },
  { -- Add cmakelang (formatting) and cmakelint to mason
    -- https://github.com/mason-org/mason.nvim
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "cmakelang", "cmakelint" })
    end,
  },
  -- --| cmake-language-server or neocmakelsp |------------------------------------------------------------------------
  { -- Add clangd and set up lspconfig
    -- https://github.com/neovim/nvim-lspconfig
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        --[[
          cmake = {
          cmd = { "cmake-language-server" },
          filetypes = { "cmake" },
          root_markers = { "CMakePresets.json", "CTestConfig.cmake", ".git", "build", "cmake" },
          init_options = {
            buildDirectory = "build",
          },
        },
        --]]
        neocmake = {
          cmd = { "neocmakelsp", "stdio" },
          filetypes = { "cmake" },
          root_markers = { "CMakePresets.json", "CTestConfig.cmake", ".git", "build", "cmake" },
        },
      },
    },
  },
  {
    -- https://github.com/stevearc/conform.nvim
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        cmake = { "cmake_format" },
        cmake_lists = { "cmake_format" },
      },
      formatters = {
        cmake_format = {
          append_args = { "-i", "-c", "/home/lannakin/templates/cmakeformat.yaml", "--line-ending=unix" },
        }
      }
    },
  },
  {
    -- https://github.com/Civitasv/cmake-tools.nvim
    "Civitasv/cmake-tools.nvim",
    lazy = true,
    init = function()
      local loaded = false
      local function check()
        local cwd = vim.uv.cwd()
        if vim.fn.filereadable(cwd .. "/CMakeLists.txt") == 1 then
          require("lazy").load { plugins = { "cmake-tools.nvim" } }
          loaded = true
        end
      end
      check()
      vim.api.nvim_create_autocmd("DirChanged", {
        callback = function()
          if not loaded then
            check()
          end
        end,
      })
    end,
    opts = {},
  },
  {
    -- https://github.com/mfussenegger/nvim-lint
    "mfussenegger/nvim-lint",
    optional = true,
    -- opts = function(_, opts)
    opts = {
      linters_by_ft = {
        cmake = { "cmake_lint" },
      },
    linters = {
        cmake_lint = {
          args = { "--config=$HOME/templates/cmakelintrc" },
        },
      },
    },
  },
}

