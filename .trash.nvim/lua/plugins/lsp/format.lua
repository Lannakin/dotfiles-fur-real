-- /plugins/format.lua
-- disabled if below line is active
-- if true then return {} end
return {
  {
    -- https://github.com/nvimtools/none-ls.nvim
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = function(_, opts)
      local nls = require("null-ls").builtins
      opts.root_dir = opts.root_dir
        or require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git")
      opts.sources = {
        nls.formatting.stylua,
        nls.formatting.shfmt,
      }
      return opts
    end,
  },
  {
    -- https://github.com/sbdchd/neoformat
    "sbdchd/neoformat",
  },
}
