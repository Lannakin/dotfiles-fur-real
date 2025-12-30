-- ./plugins/lsp/lua.lua
-- disabled if below line is active
-- if true then return {} end

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lua_ls = {
          cmd = { "lua-language-server" },
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
              filetypes = { "lua" },
              format = { enable = false },
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
                checkThirdParty = true,
                library = {
                  vim.env.VIMRUNTIME,
                },
              },
            },
          },
        },
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
                "usr/lib/lua/5.4/lua/luv.so",
                "$HOME/.local/share/nvim/lazy",
                "$HOME/.local/share/nvim/lazy/bufferline.nvim", -- for some reason, emmylua_ls can't find any plugins
                "$HOME/.local/share/nvim/lazy/neogen",          -- unless I explicitly tell it where they are
                "$HOME/.local/share/nvim/lazy/lazydev.nvim",
                "$HOME/.local/share/nvim/lazy/luvit-meta",
                "$HOME/.local/share/nvim/lazy/dashboard-nvim",
                "$HOME/.local/share/nvim/lazy/solarized-osaka.nvim",
                "$HOME/.local/share/nvim/lazy/which-key.nvim",
                "$HOME/LA-repos/cat-neosolarized.nvim",
                "/usr/share/nvim/runtime",
                vim.api.nvim_get_runtime_file("lua/*.lua", true),
              },
            },
          },
        },
        stylua = { enabled = false },
      },
    },
  },
}
