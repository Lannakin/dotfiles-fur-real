-- /utils/fanyutils.lua
-- disabled if below line is active
-- if true then return {} end
-- src: https://github.com/fanlumaster/lazyvim-archlinux/blob/master/lua/fany/utils/fanyutils.lua

-- +------------------------------------------+
-- |         fany filename operations         |
-- +------------------------------------------+

local myutils = {}

-- Get the relative path of the current file
-- It is easy to modify the single file to be compiled in cmake.
function myutils.copy_relative_path()
  local current_file = vim.fn.expand "%"
  local relative_path = vim.fn.fnamemodify(current_file, ":~:.")
  local clipboard_content = relative_path
  clipboard_content = ".\\" .. clipboard_content
  clipboard_content = string.gsub(clipboard_content, "\\", "/") -- Replace the default \ separator with /
  vim.fn.setreg("+", clipboard_content)
end

-- Copy Current filename without extension
function myutils.copy_current_filename()
  local current_file = vim.fn.expand "%:t" -- copy only the filename, not the full path
  local clipboard_content = current_file
  -- clipboard_content = string.gsub(clipboard_content, "%..+", "")
  vim.fn.setreg("+", clipboard_content)
end

-- Get the absolute path to the current file
function myutils.copy_absolute_path()
  local current_file_abs_path = vim.fn.expand "%:p"
  vim.fn.setreg("+", current_file_abs_path)
end

return myutils
