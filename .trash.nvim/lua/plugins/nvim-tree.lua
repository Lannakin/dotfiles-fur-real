-- disabled; using neo-tree
-- disabled if below line is active
if true then
  return {}
end
-- https://github.com/nvim-tree/nvim-tree.lua
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- https://github.com/nvim-tree/nvim-tree.lua/wiki/Open-At-Startup
-- open at startup
-- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
-- ALWAYS open:
--[[ local function open_nvim_tree()

  -- open the tree
   require("nvim-tree.api").tree.open()
 end ]]
-- Open For Files And [No Name] Buffers
--[[local function open_nvim_tree(data)

  -- buffer is a real file on the disk
  local real_file = vim.fn.filereadable(data.file) == 1

  -- buffer is a [No Name]
  local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

  if not real_file and not no_name then
    return
  end

  -- open the tree, find the file but don't focus it
  require("nvim-tree.api").tree.toggle({ focus = false, find_file = true, })
end]]
return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function(__, opts)
    require("config.nvim-tree").setup(opts)
    opts = {
      filesystem = {
        filtered_items = {
          visible = true, -- Show hidden files in the tree
          hide_dotfiles = false, -- Do not hide dotfiles (like .gitignore)
          hide_gitignored = false, -- Do not hide files in .gitignore
        },
      },
      hijack_directories = {
        enable = false,
        auto_open = false,
      },
    }
  end,
}
