-- root init.lua
vim.o.winborder = "single"

-- bootstrap lazy.nvim, LazyVim and your plugins
-- require("config.lazy") -- default load order
require "config.options"
require "config.lazy"     -- load order change
require "plugins.util"    -- clang can't find util omg
