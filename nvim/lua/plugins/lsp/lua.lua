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
              codeLens = { enable = true },
              diagnostics = {
                enable = true,
                unusedLocalExclude = { "_*" },
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
              runtime = { version = "LuaJIT" },
              workspace = {
                checkThirdParty = true,
                library = { vim.env.VIMRUNTIME },
              },
            },
          },
        },
        emmylua_ls = {
        -- emmylua = {
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
          codeLens = { enable = true },
          hint = { enable = true },
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
              --[[
              library = {
                "$LLS_Addons/luvit",
                "${3rd}/luv/library",
                "usr/lib/lua/5.4/lua/luv.so",
                "$HOME/.local/share/nvim/lazy",
                vim.env.VIMRUNTIME,
                -- For LSP Settings Type Annotations: https://github.com/neovim/nvim-lspconfig#lsp-settings-type-annotations
                vim.api.nvim_get_runtime_file("lua/lspconfig", false)[1],
                -- "/usr/share/nvim/runtime",
                -- vim.fn.expand("$VIMRUNTIME"),
                -- vim.fn.expand("$XDG_CONFIG_HOME") .. "/nvim/lua",
                -- vim.api.nvim_get_runtime_file("lua/*.lua", true),
                },
              --]]
              library = { 
                vim.api.nvim_get_runtime_file("", true),
                "$HOME/.local/share/nvim/lazy/?.lua",
              },
            },
          },
        },
        stylua = { enabled = false },
      },
    },
  },
}
