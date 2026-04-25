-- /plugins/comments.lua
-- disabled if below line is active
-- if true then return {} end

---@type LazySpec
return {
  { -- add more languages
    -- https://github.com/folke/ts-comments.nvim
    "folke/ts-comments.nvim",
    opts = {},
    event = "VeryLazy",
    enabled = vim.fn.has "nvim-0.10.0" == 1,
  },
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
          textobject = "Gc",
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
    keys = {
      { "<leader>xt", "<cmd>Trouble todo toggle<cr>", desc = "[T]odo" },
      { "<leader>xT", "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>", desc = "[T]odo/Fix/Fixme" },
      { "<leader>St", "<cmd>todo Telescope<cr>", desc = "Todo" },
      { "<leader>ST", "<cmd>todo Telescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
    },
    -- end,
  },
  -- --| comment boxes |-----------------------------------------------------------------------------------------------
  { -- adds ridiculous boxes around stuff in comments, which will be great b/c i am fucking blind
    -- https://github.com/Nitestack/comment-box.nvim
    "Nitestack/comment-box.nvim",
    dependencies = "folke/ts-comments.nvim", -- wonder if needed
    opts = function()
      -- Use textwidth if set, otherwise default to 80
      local current_textwidth = vim.api.nvim_get_option_value("textwidth", { buf = 0 })
      if current_textwidth == 0 then
        current_textwidth = 80
      end

      return {
        -- comment_style:
        --  "line":   comment-box will always use line style comments
        --  "block":  comment-box will always use block style comments
        --  "auto":   comment-box will use block line style comments if
        --              multiple lines are selected, line style comments
        --              otherwise
        comment_style = "line",
        doc_width = current_textwidth, -- width of the document
        box_width = 60, -- width of the boxes
        borders = { -- symbols used to draw a box
          top = "-",
          bottom = "-",
          left = "|",
          right = "|",
          top_left = "+",
          top_right = "+",
          bottom_left = "+",
          bottom_right = "+",
        },
        line_width = 120, -- width of the lines
        lines = { -- symbols used to draw a line
          line = "-",
          line_start = "-",
          line_end = "-",
          title_left = "-|",
          title_right = "|",
        },
        outer_blank_lines_above = false, -- insert a blank line above the box
        outer_blank_lines_below = false, -- insert a blank line below the box
        inner_blank_lines = false, -- insert a blank line above and below the text
        line_blank_line_above = false, -- insert a blank line above the line
        line_blank_line_below = false, -- insert a blank line below the line
      }
    end,

    config = function(_, opts)
      require("comment-box").setup(opts)

      local wk = require "which-key"
      -- Commands:
      -- CB<position><alignment><type>[catalog_number]
      -- CB< l c r >< l c r >< aox box line > [int]
      -- aox = adaptive-width box
      -- stylua: ignore
      ---@diagnostic disable: assign-type-mismatch
      wk.add({
        { "<leader>b", group = "boxes" },
        -- boxes --
        { "<leader>bbc",  "<Cmd>CBlcbox2<CR>",   desc = "Box title, centered" },
        { "<leader>bbll", "<Cmd>CBllbox2<CR>",   desc = "Box title, left-aligned" },
        { "<leader>bbca", "<Cmd>CBlcbox10<CR>",  desc = "ASCII box title, centered" },
        { "<leader>bbla", "<Cmd>CBllbox10<CR>",  desc = "ASCII box title, left-aligned" },
        -- lines --
        { "<leader>bl",   "<Cmd>CBline<CR>",     desc = "Simple line" },
        { "<leader>bll",  "<Cmd>CBllline<CR>",   desc = "Line title, left-aligned" },
        { "<leader>bla",  "<Cmd>CBllline15<CR>", desc = "ASCII line title, left-aligned" },
        -- marks (also boxes) --
        { "<leader>bmr",  "<Cmd>CBllbox14<CR>",  desc = "Marked comment, right" },
      })
    end,
  },
}
