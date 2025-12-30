-- ./utils/plenary-utils.lua
-- disabled if below line is active
-- if true then return {} end
-- src: google ai doodad + https://github.com/fanlumaster/lazyvim-archlinux/blob/master/lua/fany/utils/fanyutils.lua

--                           +---------------------------------------------------------+
--                           |                  file operations utils                  |
--                           +---------------------------------------------------------+

local file_op_utils = {}

local nvim_buf_get_name = vim.api.nvim_buf_get_name
local setreg = vim.fn.setreg
local plenary_path = require("plenary.path")
local notify = vim.notify

-- --| path of file relative to current working directory |------------------------------------------------------------

function file_op_utils.copy_relative_path()
  local absolute_path = nvim_buf_get_name(0)            -- get absolute path
  local relative_path = plenary_path:new(absolute_path):make_relative() -- use plenary to make relative to cwd
  local relative_path_msg = ("copied to clipboard: " .. relative_path)
  setreg("+", relative_path)                            -- move to system clipboard register

  notify( relative_path_msg, "info" )
end

-- --| absolute path of file |-----------------------------------------------------------------------------------------
function file_op_utils.copy_absolute_path()
  local absolute_path = nvim_buf_get_name(0)                    -- get absolute path
  local absolute_path_msg = ("copied to clipboard: " .. absolute_path)
  setreg("+", absolute_path)                                    -- move to system clipboard register

  notify( absolute_path_msg, "info" )
end

return file_op_utils
