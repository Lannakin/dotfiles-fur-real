-- /plugins/lsp/lua.lua
-- disabled if below line is active
-- if true then return {} end

---@type LazySpec
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {},
    opts = {
      ---@type lspconfig.options
      enabled = true,
      servers = {
        emmylua_ls = {
          -- capabilities = require("capabilities").make_capabilities(),
          cmd = { "emmylua_ls" },
          filetypes = { "lua" },
          root_markers = {
            ".luarc.json",
            ".emmyrc.json",
            ".luacheckrc",
            ".git",
          },
          workspace_required = false,
          settings = {
            runtime = {
              version = "LuaJIT",
              requirepattern = {
                "lua/?.lua",
                "lua/?/init.lua",
                "?/lua/?.lua",
                "?/lua/?/init.lua",
              },
            },
            workspace = {
              library = {
                "$LLS_Addons/luvit",
                "$HOME/.local/share/nvim/lazy",
                "${3rd}/luv/library",
                vim.api.nvim_get_runtime_file("lua/*.lua", true),
              },
            },
          },
        },
        setup = {
          emmylua_ls = function(_, _opts) end,
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      enabled = false,
      servers = {
        lua_ls = {
          cmd = { "lua_ls" },
          settings = {
            Lua = {
              diagnostics = {
                enable = true,
                unusedLocalExclude = {
                  "_*",
                },
                globals = { "vim" },
              },
              completion = {
                autoRequire = true,
                callSnippet = "Disable",
                displayContext = 2,
              },
              format = {
                enable = true,
              },
              hint = {
                enable = true,
                setType = true,
                arrayIndex = "Disable",
                await = true,
                paramName = "All",
                paramType = true,
                semicolon = "SameLine",
              },
              runtime = {
                version = "LuaJIT",
              },
            },
          },
        },
        setup = {
          lua_ls = function(_, _opts) end,
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {},
    opts = {
      enabled = false,
      servers = {
        stylua = {},
      },
      setup = {
        stylua = function(_, opts) end,
      },
    },
  },
}
