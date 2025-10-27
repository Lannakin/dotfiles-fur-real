-- /plugins/lsp/lua.lua
-- disabled if below line is active
-- if true then return {} end

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {},
    opts = {
      servers = {
        emmylua_ls = {
          -- capabilities = require("capabilities").make_capabilities(),
          enabled = true,
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
          -- emmylua_ls = function(opts) end,
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lua_ls = {
          cmd = { "lua_ls" },
          enabled = false,
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
                enable = false,
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
              workspace = {
                checkThirdParty = false,
                library = {
                  vim.env.VIMRUNTIME,
                },
              },
            },
          },
          setup = {},
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {},
    opts = {
      servers = {
        stylua = { enabled = false },
      },
      setup = {},
    },
  },
}
