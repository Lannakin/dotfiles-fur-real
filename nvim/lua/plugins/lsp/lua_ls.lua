-- /plugins/lsp/lua_ls.lua
-- disabled if below line is active
if true then return {} end

---@brief
---
--- https://github.com/luals/lua-language-server
---
--- Lua language server.
---
--- `lua-language-server` can be installed by following the instructions [here](https://luals.github.io/#neovim-install).
---
--- The default `cmd` assumes that the `lua-language-server` binary can be found in `$PATH`.
---
--- See `lua-language-server`'s [documentation](https://luals.github.io/wiki/settings/) for an explanation of the above fields:
--- * [Lua.runtime.path](https://luals.github.io/wiki/settings/#runtimepath)
--- * [Lua.workspace.library](https://luals.github.io/wiki/settings/#workspacelibrary)

--[[ 
vim.lsp.config("lua_ls", {
  capabilities = require("config.capabilities").make_capabilities(),
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = {
    ".emmyrc.json",
    ".luarc.json",
    ".luarc.jsonc",
    ".luacheckrc",
    ".stylua.toml",
    "stylua.toml",
    "selene.toml",
    "selene.yml",
    ".git",
  },

  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if
        path ~= vim.fn.stdpath "config"
        and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
      then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
      runtime = {
        version = "LuaJIT",
        path = {
          "lua/?.lua",
          "lua/?/init.lua",
        },
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          -- Depending on the usage, you might want to add additional paths
          -- here.
          -- '${3rd}/luv/library'
          -- '${3rd}/busted/library'
        },
      },
    })
  end,
})

 ]]
---@type vim.lsp.Config
return {
  {
    "neovim/nvim-lspconfig",
    -- opts = function(_, opts)
    opts = {
      enabled = false,
      -- ---@type lspconfig.options
      servers = {
        lua_ls = {
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
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
              },
              -- Make the server aware of Neovim runtime files
              workspace = {
                checkThirdParty = false,
                -- library = vim.iter(
                --     {
                --       vim.env.VIMRUNTIME,
                --
                --       -- Depending on the usage, you might want to add additional paths here.
                --       "${3rd}/luv/library",
                --       -- "${3rd}/busted/library",
                --     },
                --     vim.api.nvim_get_runtime_file("lua/vim/*", true)
                --     -- vim.api.nvim_get_runtime_file("lua/vim/iter", true)
                --   )
                --   :flatten()
                --   :totable(),
                -- ),
              },
            },
          },
        },
      },
    },
  },
}
