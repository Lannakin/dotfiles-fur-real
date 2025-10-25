-- /config/init.lua
if vim.fn.has("nvim-0.10.0") == 0 then
  vim.api.nvim_echo({
    { "LazyVim requires Neovim >= 0.10.0\n", "ErrorMsg" },
    { "Press any key to exit", "MoreMsg" },
  }, true, {})
  vim.fn.getchar()
  vim.cmd([[quit]])
  return {}
end

require("options")
require("keymaps")
-- require("null-ls")
require("comment")
require('nvim.lua.plugins.completion')
