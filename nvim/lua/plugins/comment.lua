-- /plugins/comment.lua
-- disabled if below line is active
-- if true then return {} end
-- https://github.com/numToStr/Comment.nvim
return {
  {
    "numToStr/Comment.nvim",
    opts = {},
    config = function(_, opts)
      require("Comment").setup(opts)
    end,
    -- keys = {
    --   { "<leader>n", group = "Noice" },
    --   { "<leader>n+", "<cmd>NoiceEnable<cr>", desc = "Enable Noice" },
    --   { "<leader>n=", "<cmd>NoiceDisable<cr>", desc = "Disable Noice" },
    --   { "<leader>nd", "<cmd>NoiceDismiss<cr>", desc = "Dismiss Noice" },
    --   { "<leader>nh", "<cmd>NoiceHistory<cr>", desc = "Show Noice history" },
    -- },
  },
}
