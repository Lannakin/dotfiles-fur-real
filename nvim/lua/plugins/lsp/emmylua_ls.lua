-- /plugins/lsp/emmylua_ls.lua
-- disabled if below line is active
-- if true then return {} end

---@brief
---
--- https://github.com/EmmyLuaLs/emmylua-analyzer-rust
---
--- Emmylua Analyzer Rust. Language Server for Lua.
---
--- `emmylua_ls` can be installed using `cargo` by following the instructions[here]
--- (https://github.com/EmmyLuaLs/emmylua-analyzer-rust?tab=readme-ov-file#install).
---
--- The default `cmd` assumes that the `emmylua_ls` binary can be found in `$PATH`.
--- It might require you to provide cargo binaries installation path in it.

---@type LazySpec
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {},
    opts = {
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
              library = vim.api.nvim_get_runtime_file("lua/*.lua", true),
            },
          },
        },
        setup = {
          emmylua_ls = function(_, opts)
          end,
        },
      },
    },
  },
}
