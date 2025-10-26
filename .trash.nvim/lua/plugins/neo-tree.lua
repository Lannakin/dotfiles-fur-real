-- /plugins/neo-tree.lua
-- disabled if below line is active
-- if true then return {} end
return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      popup_border_style = "",
      filesystem = {
        filtered_items = {
          visible = true, -- Makes "hide" mean "dimmed out" instead of completely hidden
          hide_dotfiles = false, -- Set to false to show dotfiles (hidden files)
          hide_gitignored = true, -- You can adjust this based on your preference
        },
      },
    },
  },
}
