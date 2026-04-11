-- ./plugins/lsp/clang.lua
-- disabled if below line is active
-- if true then return {} end
-- https://github.com/dpetka2001/dotfiles/blob/main/dot_config/nvim/lua/plugins/extras/lang/clang.lua

-- local util = require ("util")

local function switch_source_header(client, bufnr)
  local method_name = "textDocument/switchSourceHeader"
  local params = vim.lsp.util.make_text_document_params(bufnr)
  client:request(method_name, params, function(err, result)
    if err then
      error(tostring(err))
    end
    if not result then
      vim.notify "corresponding file cannot be determined"
      return
    end
    vim.cmd.edit(vim.uri_to_fname(result))
  end, bufnr)
end

return {
  -- --| c-lang syntax |-----------------------------------------------------------------------------------------------
  { -- Add `c` and `cpp` to treesitter
    --https://github.com/nvim-treesitter/nvim-treesitter
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "c", "cpp" } },
  },
  { -- Add `tools` to mason
    -- https://github.com/mason-org/mason.nvim
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "clang-format" })
    end,
  },
  -- --| clangd extensions |-------------------------------------------------------------------------------------------
  {
    -- https://github.com/p00f/clangd_extensions.nvim
    "p00f/clangd_extensions.nvim",
    lazy = true,
    config = function() end, -- avoid duplicate setup call because it also loads in line 102
    opts = {
      memory_usage = { border = "single" },
      symbol_info = { border = "single" },
      inlay_hints = { inline = false },
      ast = {
        -- Microsoft codicons
        role_icons = {
          type = "",
          declaration = "",
          expression = "",
          specifier = "",
          statement = "",
          ["template argument"] = "",
        },
        kind_icons = {
          Compound = "",
          Recovery = "",
          TranslationUnit = "",
          PackExpansion = "",
          TemplateTypeParm = "",
          TemplateTemplateParm = "",
          TemplateParamObject = "",
        },
      },
    },
  },
  -- --| c-lang lspconfig |--------------------------------------------------------------------------------------------
  { -- Add clangd and set up lspconfig
    -- https://github.com/neovim/nvim-lspconfig
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          keys = {
            { "<leader>cR", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
          },
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern(
              "Makefile",
              "configure.ac",
              "configure.in",
              "config.h.in",
              "meson.build",
              "meson_options.txt",
              "build.ninja"
            )(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(
              fname
            )
          end,
          capabilities = {
            offsetEncoding = { "utf-16" },
          },
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
          },
          filetypes = { "c", "cpp", "arduino" },
          init_options = {
            usePlaceholders = true,
            completeUnimported = true,
            clangdFileStatus = true,
          },
        },
        cmake = {
          cmd = { "cmake-language-server" },
          filetypes = { "cmake" },
          root_markers = { "CMakePresets.json", "CTestConfig.cmake", ".git", "build", "cmake" },
          init_options = {
            buildDirectory = "build",
          },
        },
        --[[
        ccls = {
          cmd = { "ccls" },
          filetypes = { "c", "cpp", "objc" },
          root_markers = { "compile_commands.json", ".ccls", ".git" },
          offset_encoding = "utf-32",
          -- ccls does not support sending a null root directory
          workspace_required = true,
          on_attach = function(client, bufnr)
            vim.api.nvim_buf_create_user_command(bufnr, "LspCclsSwitchSourceHeader", function()
              switch_source_header(client, bufnr)
            end, { desc = "Switch between source/header" })
          end,
        },
        --]]
      },
      setup = {
        clangd = function(_, opts)
          -- local clangd_ext_opts = require("lazyvim.util").opts "clangd_extensions.nvim"
          local clangd_ext_opts = LazyVim.opts "clangd_extensions.nvim"
          require("clangd_extensions").setup(vim.tbl_deep_extend("force", clangd_ext_opts or {}, { server = opts }))

          -- <https://www.reddit.com/r/raspberrypipico/comments/m5lsmw/comment/l8lov9j/> rpi stuff
          table.insert(opts.cmd, "--query-driver=/usr/bin/arm-none-eabi-g*")
          return false
        end,
      },
    },
  },
  -- --| c-lang formatting |-------------------------------------------------------------------------------------------
  {
    -- https://github.com/stevearc/conform.nvim
    "stevearc/conform.nvim",
    -- event = 'BufWritePre',
    opts = {
      formatters_by_ft = {
        c = { "clang-format" },
        cpp = { "clang-format" },
        objc = { "clang-format" },
        objcpp = { "clang-format" },
      },
      formatters = {
        ["clang-format"] = {
          args = { "-style=file:/home/lannakin/LA-repos/dotfiles/system/lsc-environment/.clang-format" },
        },
      },
    },
  },
}
