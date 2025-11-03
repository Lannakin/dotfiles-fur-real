-- /plugins/lsp/lua.lua
-- disabled if below line is active
-- if true then return {} end

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {},
    opts = {
      servers = {

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
          cmd = { "lua-language-server" },
          enabled = true,
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
              -- runtime = {
              --   version = "LuaJIT",
              -- },
              workspace = {
                checkThirdParty = true,
                -- library = {
                --   vim.env.VIMRUNTIME,
                -- },
              },
            },
          },
        },
        emmylua_ls = {
          -- capabilities = require("capabilities").make_capabilities(),
          enabled = false,
          cmd = { "emmylua_ls" },
          filetypes = { "lua" },
          root_markers = {
            ".luarc.json",
            ".emmyrc.json",
            ".luacheckrc",
            ".git",
          },
          workspace_required = true,
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
                "${3rd}/luv/library",
                "$HOME/.local/share/nvim/lazy",
                "$HOME/.local/share/nvim/lazy/bufferline.nvim", -- for some reason, emmylua_ls can't find any plugins
                "$HOME/.local/share/nvim/lazy/neogen",          -- unless I explicitly tell it where they are
                "$HOME/.local/share/nvim/lazy/lazydev.nvim",
                "$HOME/.local/share/nvim/lazy/dashboard-nvim",
                "$HOME/.local/share/nvim/lazy/solarized-osaka.nvim",
                "$HOME/.local/share/nvim/lazy/which-key.nvim",
                "$HOME/LA-repos/cat-neosolarized.nvim",
                "$VIMRUNTIME",
                -- vim.api.nvim_get_runtime_file("lua/*.lua", true),
              },
            },
          },
        },
        stylua = { enabled = false },
      },
    },
  },
}
