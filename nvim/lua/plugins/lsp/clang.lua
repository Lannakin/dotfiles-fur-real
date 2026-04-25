-- ./plugins/lsp/clang.lua
-- disabled if below line is active
-- if true then return {} end
-- https://github.com/dpetka2001/dotfiles/blob/main/dot_config/nvim/lua/plugins/extras/lang/clang.lua

-- local util = require ("util")

--[[ -- ccls
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
--]]
--[[ -- clangd
--]]

-- https://clangd.llvm.org/extensions.html#switch-between-sourceheader
local function switch_source_header(bufnr, client)
  local method_name = "textDocument/switchSourceHeader"
  ---@diagnostic disable-next-line:param-type-mismatch
  if not client or not client:supports_method(method_name) then
    return vim.notify(("method %s is not supported by any servers active on the current buffer"):format(method_name))
  end
  local params = vim.lsp.util.make_text_document_params(bufnr)
  ---@diagnostic disable-next-line:param-type-mismatch
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

local function symbol_info(bufnr, client)
  local method_name = "textDocument/symbolInfo"
  ---@diagnostic disable-next-line:param-type-mismatch
  if not client or not client:supports_method(method_name) then
    return vim.notify("Clangd client not found", vim.log.levels.ERROR)
  end
  local win = vim.api.nvim_get_current_win()
  local params = vim.lsp.util.make_position_params(win, client.offset_encoding)
  ---@diagnostic disable-next-line:param-type-mismatch
  client:request(method_name, params, function(err, res)
    if err or #res == 0 then
      -- Clangd always returns an error, there is no reason to parse it
      return
    end
    local container = string.format("container: %s", res[1].containerName) ---@type string
    local name = string.format("name: %s", res[1].name) ---@type string
    vim.lsp.util.open_floating_preview({ name, container }, "", {
      height = 2,
      width = math.max(string.len(name), string.len(container)),
      focusable = false,
      focus = false,
      title = "Symbol Info",
    })
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
  -- --| clangd lspconfig |--------------------------------------------------------------------------------------------
  { -- Add clangd and set up lspconfig
    -- https://github.com/neovim/nvim-lspconfig
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          enabled = false,
          capabilities = {
            textDocument = {
              completion = {
                editsNearCursor = true,
              },
            },
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
          get_language_id = function(_, ftype)
            local t = { objc = "objective-c", objcpp = "objective-cpp", cuda = "cuda-cpp" }
            return t[ftype] or ftype
          end,
          ---@param init_result ClangdInitializeResult
          on_init = function(client, init_result)
            if init_result.offsetEncoding then
              client.offset_encoding = init_result.offsetEncoding
            end
          end,
          on_attach = function(client, bufnr)
            vim.api.nvim_buf_create_user_command(bufnr, "LspClangdSwitchSourceHeader", function()
              switch_source_header(bufnr, client)
            end, { desc = "Switch between source/header" })

            vim.api.nvim_buf_create_user_command(bufnr, "LspClangdShowSymbolInfo", function()
              symbol_info(bufnr, client)
            end, { desc = "Show symbol info" })
          end,
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
        --]]
        -- --| ccls lspconfig |----------------------------------------------------------------------------------------
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
      },
      setup = {
        init_options = {
          cache = {
            directory = ".ccls-cache",
          },
        },
        --[[
        clangd = function(_, opts)
          -- local clangd_ext_opts = require("lazyvim.util").opts "clangd_extensions.nvim"
          local clangd_ext_opts = LazyVim.opts "clangd_extensions.nvim"
          require("clangd_extensions").setup(vim.tbl_deep_extend("force", clangd_ext_opts or {}, { server = opts }))

          -- <https://www.reddit.com/r/raspberrypipico/comments/m5lsmw/comment/l8lov9j/> rpi stuff
          table.insert(opts.cmd, "--query-driver=/usr/bin/arm-none-eabi-g*")
          return false
        end,
        --]]
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
