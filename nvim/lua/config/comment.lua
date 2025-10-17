-- Do not require autocmds, keymaps, lazy or options under lua/config/ or lazyvim.config manually. LazyVim will load those files automatically.
if true then return {} end
require('Comment').setup()
