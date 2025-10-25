-- /plugins/lsp/none-ls.lua
-- disabled if below line is active
if true then
  return {}
end
return {
  {
    "nvimtools/none-ls.nvim",

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
}
