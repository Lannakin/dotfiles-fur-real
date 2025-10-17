-- disabled; using neo-tree
-- disabled if below line is active
if true then
  return {}
end
-- https://github.com/nvim-tree/nvim-tree.lua
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
    }
  end,
}
