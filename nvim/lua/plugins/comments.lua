-- /plugins/comments.lua
-- disabled if below line is active
-- if true then return {} end

return {
  {
    -- https://github.com/numToStr/Comment.nvim
    "numToStr/Comment.nvim",
    event = "LazyFile",
    opts = {
      pre_hook = function()
        require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
      end,
    },
    config = function(_, opts)
      require("Comment").setup(opts)
    end,
    -- keys = {
    --   { "<leader>n", group = "Comments" },
    --   { "<leader>n+", "<cmd>NoiceEnable<cr>", desc = "Enable Noice" },
    -- },
  },
  { -- Highlight todo, notes, etc in comments
    -- https://github.com/folke/todo-comments.nvim
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    opts = {},
    keys = {
      { "]t", function() require("todo-comments").jump_next() end, desc = "Todo: Next Comment" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Todo: Previous Comment" },
      { "<leader>xt", "<cmd>Trouble todo toggle<cr>", desc = "[T]odo" },
      { "<leader>xT", "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>", desc = "[T]odo/Fix/Fixme" },
    },
  },
}
