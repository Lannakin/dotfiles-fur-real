-- /plugins/comments.lua
-- disabled if below line is active
-- if true then return {} end

---@type LazyPluginSpec[]
return {
  { -- comments out lines
    -- https://github.com/nvim-mini/mini.comment
    "nvim-mini/mini.comment",
    opts = function()
      return {
        mappings = {
          -- Normal and Visual modes
          comment = "<C-7>",
          comment_line = "<C-7>",
          comment_visual = "<C-7>",
          -- Define 'comment' textobject (like `dgc` - delete whole comment block)
          -- Works also in Visual mode if mapping differs from `comment_visual`
          textobject = "gc",
        },
      }
    end,
  },
  { -- Highlight todo, notes, etc in comments
    -- https://github.com/folke/todo-comments.nvim
    "folke/todo-comments.nvim",
    -- cmd = { "TodoTrouble", "TodoTelescope" },
    -- event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    opts = {},
    keys = -- function()
      --[[return]] {
        { "<leader>xt", "<cmd>Trouble todo toggle<cr>", desc = "[T]odo" },
        { "<leader>xT", "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>", desc = "[T]odo/Fix/Fixme" },
        { "<leader>St", "<cmd>todo Telescope<cr>", desc = "Todo" },
        { "<leader>ST", "<cmd>todo Telescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
      }
    -- end,
  },
  { -- adds ridiculous boxes around stuff in comments, which will be great b/c i am fucking blind
    -- https://github.com/Nitestack/comment-box.nvim
    "Nitestack/comment-box.nvim",
    dependencies = "folke/ts-comments.nvim", -- wonder if needed
    opts = function()
      local wk = require "which-key"
      local opts = { noremap = true, silent = true }

      -- Commands:
      -- CB<position><alignment><type>[catalog_number]
      -- CB< l c r >< l c r >< aox box line > [int]
      -- aox = adaptive-width box
      wk.add {
        { "<Leader>b", group = "boxes" },
        -- boxes --
        { "<Leader>bbc",  "<Cmd>CBlcbox2<CR>",  desc = "Box title, centered", opts },
        { "<Leader>bbll", "<Cmd>CBllbox2<CR>",  desc = "Box title, left-aligned", opts },
        { "<Leader>bbca", "<Cmd>CBlcbox10<CR>", desc = "ASCII box title, centered", opts },
        { "<Leader>bbca", "<Cmd>CBllbox10<CR>", desc = "ASCII box title, left-aligned", opts },
        -- lines --
        { "<Leader>bl",    "<Cmd>CBline<CR>",      desc = "Simple line", opts },
        { "<Leader>bll",   "<Cmd>CBllline<CR>",    desc = "Line title, left-aligned", opts },
        { "<Leader>bla",   " <Cmd>CBllline15<CR>", desc = "ASCII line title, left-aligned", opts },
        -- marks (also boxes) --
        { "<Leader>bmr",   "<Cmd>CBllbox14<CR>",   desc = "Marked comment, right", opts },
      }

      return {
        -- comment_style:
        --  "line":   comment-box will always use line style comments
        --  "block":  comment-box will always use block style comments
        --  "auto":   comment-box will use block line style comments if
        --              multiple lines are selected, line style comments
        --              otherwise
        comment_style = "line",
        doc_width = 80, -- width of the document
        box_width = 60, -- width of the boxes
        borders = { -- symbols used to draw a box
          top = "─",
          bottom = "─",
          left = "│",
          right = "│",
          top_left = "┌",
          top_right = "┐",
          bottom_left = "└",
          bottom_right = "┘",
        },
        line_width = 70, -- width of the lines
        lines = { -- symbols used to draw a line
          line = "─",
          line_start = "─",
          line_end = "─",
          title_left = "─",
          title_right = "─",
        },
        outer_blank_lines_above = true, -- insert a blank line above the box
        outer_blank_lines_below = true, -- insert a blank line below the box
        inner_blank_lines = true,       -- insert a blank line above and below the text
        line_blank_line_above = true,   -- insert a blank line above the line
        line_blank_line_below = true,   -- insert a blank line below the line
      }
    end,
  },
}
