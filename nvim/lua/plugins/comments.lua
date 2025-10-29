-- /plugins/comments.lua
-- disabled if below line is active
-- if true then return {} end

return {
  {
    -- https://github.com/nvim-mini/mini.comment
    "nvim-mini/mini.comment",
    opts = function()
    return {
      mappings = {
        -- Toggle comment (like `gcip` - comment inner paragraph) for both
        -- Normal and Visual modes
        comment = "<C-7>",

        -- Toggle comment on current line
        comment_line = "<C-7>",

        -- Toggle comment on visual selection
        comment_visual = "<C-7>",

        -- Define 'comment' textobject (like `dgc` - delete whole comment block)
        -- Works also in Visual mode if mapping differs from `comment_visual`
        textobject = "gc",
      },
    }
    end
  },
  { -- Highlight todo, notes, etc in comments
    -- https://github.com/folke/todo-comments.nvim
    "folke/todo-comments.nvim",
    -- cmd = { "TodoTrouble", "TodoTelescope" },
    -- event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    opts = {},
    keys = function()
      return {
        { "<leader>xt", "<cmd>Trouble todo toggle<cr>", desc = "[T]odo" },
        { "<leader>xT", "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>", desc = "[T]odo/Fix/Fixme" },
        { "<leader>St", "<cmd>todo Telescope<cr>", desc = "Todo" },
        { "<leader>ST", "<cmd>todo Telescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
      }
    end
  },
  { -- adds ridiculous boxes around stuff in comments, which will be great b/c i am fucking blind
    -- https://github.com/LudoPinelli/comment-box.nvim
    "LudoPinelli/comment-box.nvim",
    opts = {},
  },
}
