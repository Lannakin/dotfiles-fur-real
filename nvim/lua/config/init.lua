if vim.fn.has("nvim-0.10.0") == 0 then
  vim.api.nvim_echo({
    { "LazyVim requires Neovim >= 0.10.0\n", "ErrorMsg" },
    { "Press any key to exit", "MoreMsg" },
  }, true, {})
  vim.fn.getchar()
  vim.cmd([[quit]])
  return {}
end

vim.o.winborder = 'none'

require("options")
-- require("neo-tree")
require("null-ls")
require("comment")
require("cmp")