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
-- Do not require autocmds, keymaps, lazy or options under lua/config/ or
-- lazyvim.config manually. LazyVim will load those files automatically.
require("lazy")
require("autocmds")
require("options")
require("keymaps")
