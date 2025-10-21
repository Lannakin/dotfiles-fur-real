-- root init.lua

-- winborder:
-- values: 'single', 'double', 'solid', 'none', custom: comma-separated list of exactly 8 characters in clockwise order
-- starting from topleft.
-- seems incompatible
vim.o.winborder = "single"
-- vim.o.winborder = "┌,─,┐,│,┘,─,└,│"
--[[ -- errors when trying to set this via lua --
10:08:20 AM msg_show Error detected while processing /home/lannakin/.config/nvim/init.lua:
E5113: Error while calling lua chunk: /home/lannakin/.config/nvim/init.lua:3: loop or previous error loading module 'config.options'
stack traceback:
  [C]: in function 'require'
  /home/lannakin/.config/nvim/init.lua:3: in main chunk
Failed loading config.options

vim/_options.lua:0: E474: Invalid argument

# stacktrace:
  - vim/_options.lua:0 _in_ **_set**
  - vim/_options.lua:0 _in_ **__newindex**
  - .config/nvim/lua/config/options.lua:18
  - /LazyVim/lua/lazyvim/config/init.lua:288
  - /LazyVim/lua/lazyvim/config/init.lua:287 _in_ **_load**
  - /LazyVim/lua/lazyvim/config/init.lua:298 _in_ **load**
  - /LazyVim/lua/lazyvim/config/init.lua:330 _in_ **init**
  - /LazyVim/lua/lazyvim/plugins/init.lua:20 _in_ **load**
  - .config/nvim/lua/config/lazy.lua:18
  - .config/nvim/init.lua:2
--]]
-- vim.cmd([[set winborder="┌,─,┐,│,┘,─,└,│"]])

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.options")
