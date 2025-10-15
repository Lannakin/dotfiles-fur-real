if true then return {} end
-- https://github.com/nvim-tree/nvim-tree.lua
require("nvim-tree").setup({
  disable_netrw = true,
  hijack_netrw = true,
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  update_focused_file = {
    enable = true,
    update_root = true,
    update_cwd = false,
    ignore_list = {},
  },
  system_open = {
    cmd = nil,
    args = {},
  },
  filters = {
    dotfiles = false,
    custom = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 30,
    side = "left",
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    preserve_window_proportions = true,
  },
  renderer = {
    highlight_git = true,
    root_folder_label = false,
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        bookmark = "◉",
        git = {
          unstaged = "",
          staged = "",
          unmerged = "",
          renamed = "",
          deleted = "",
          untracked = "",
          ignored = "",
        },
        folder = {
          default = "",
          open = "",
          symlink = "",
        },
      },
      show = {
        git = false,
        file = true,
        folder = true,
        folder_arrow = true,
      },
    },
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  actions = {
    change_dir = {
      enable = true,
      global = false,
    },
    open_file = {
      quit_on_open = false,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame", "lazy" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
})
