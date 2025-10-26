-- plugins/buffer-layout.lua
-- disabled if below line is active
-- if true then return {} end
return {
  {
    -- https://github.com/folke/noice.nvim
    "folke/noice.nvim",
    enabled = true,
    opts = {
      views = {
        cmdline = {
          border = {
            style = "single",
            padding = { 0, 0 },
          },
        },
        cmdline_popup = {
          border = { style = "single" },
          position = {
            row = 5,
            col = "50%",
          },
          size = {
            width = 60,
            height = "auto",
          },
        },
        popupmenu = {
          relative = "editor",
          position = {
            row = 8,
            col = "50%",
          },
          size = {
            width = 60,
            height = 10,
          },
          border = {
            style = "single",
            padding = { 0, 1 },
          },
          win_options = {
            winhighlight = { Normal = "Normal", FloatBorder = "NoiceCmdlinePopupBorder" },
          },
        },
      },
    },
    config = function(_, opts)
      require("noice").setup(opts)
    end,
  },
  {
    -- https://github.com/nvim-neo-tree/neo-tree.nvim
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
  {
    -- https://github.com/mrjones2014/smart-splits.nvim
    "mrjones2014/smart-splits.nvim",
     -- to use Kitty multiplexer support, run the post install hook
    build = "./kitty/install-kittens.bash",
  },
}
