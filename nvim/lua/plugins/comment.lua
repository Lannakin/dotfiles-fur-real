-- disabled if below line is active
-- if true then return {} end
return {
  "numToStr/Comment.nvim",
  config = function()
    require('Comment').setup()
  end,
}
