-- /plugins/name.lua
-- disabled if below line is active
-- if true then return {} end

---@type LazyPluginSpec[]
return {
  {
    -- https://github.com/stevearc/conform.nvim
    "stevearc/conform.nvim",
    opts = function()
      local plugin = require("lazy.core.config").plugins["conform.nvim"]

      ---@type conform.setupOpts
      local opts = {
        default_format_opts = {
          timeout_ms = 3000,
        },
        formatters_by_ft = {
          -- lua = { "stylua" },
          -- sh = { "shfmt" },
          c = { "clangd" },
        },
        -- The options you set here will be merged with the builtin formatters.
        -- You can also define any custom formatters here.
        ---@type table<string, conform.FormatterConfigOverride|fun(bufnr: integer): nil|conform.FormatterConfigOverride>
        formatters = {
          injected = { options = { ignore_errors = true } },
        },
      }
      return opts
    end,
  },
}
