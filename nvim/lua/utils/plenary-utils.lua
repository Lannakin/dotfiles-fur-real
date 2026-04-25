-- ./utils/plenary-utils.lua
-- disabled if below line is active
-- if true then return {} end
-- src: google ai doodad + https://github.com/fanlumaster/lazyvim-archlinux/blob/master/lua/fany/utils/fanyutils.lua
-- src: https://github.com/nvim-lua/plenary.nvim

--                           +---------------------------------------------------------+
--                           |                  file operations utils                  |
--                           +---------------------------------------------------------+

local file_op_utils = {}

local nvim_buf_get_name = vim.api.nvim_buf_get_name
local setreg = vim.fn.setreg
local plenary_path = require "plenary.path"
local notify = vim.notify

-- --| absolute path of file |-----------------------------------------------------------------------------------------
function file_op_utils.copy_absolute_path()
  local absolute_path = nvim_buf_get_name(0) -- get absolute path
  -- local absolute_path = plenary_path:new(nvim_buf_get_name(0)) -- get absolute path

  local absolute_path_msg = ("copied to clipboard: " .. absolute_path)

  print(absolute_path)
  setreg("+", absolute_path) -- move to system clipboard register

  notify(absolute_path_msg, 2)
end

-- --| get file name |-------------------------------------------------------------------------------------------------
function file_op_utils.copy_file_name()
  -- local absolute_path = vim.fn.expand "%"
  -- local file_name = vim.fn.expand("%:t")
  -- local absolute_path = plenary_path:new(nvim_buf_get_name(0)) -- get absolute path
  -- local file_name = absolute_path.filename
  local file_name = vim.fn.expand('%:t')
  print(file_name)

  local file_name_msg = ("copied to clipboard: " .. file_name)
  -- print(absolute_path)

  if file_name and file_name ~= "" then
    print(file_name) -- make it exist
    setreg("+", file_name) -- move to system clipboard register
    notify(file_name_msg, 2)
  end
end

-- --| path of file relative to current working directory |------------------------------------------------------------

function file_op_utils.copy_relative_path()
  -- local absolute_path = nvim_buf_get_name(0) -- get absolute path
  local absolute_path = plenary_path:new(nvim_buf_get_name(0)) -- get absolute path
  ---@diagnostic disable: undefined-field
  local relative_path = plenary_path:new(absolute_path):make_relative() -- use plenary to make relative to cwd

  local relative_path_msg = ("copied to clipboard: " .. relative_path)

  if relative_path == nil then
    notify("error: relative_path was nil", 3)
    return 1
  else
    print(relative_path)
    setreg("+", relative_path) -- move to system clipboard register

    notify(relative_path_msg, 2)
  end
end

return file_op_utils
