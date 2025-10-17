-- if true then return {} end
return {
  "andrew-george/telescope-themes",
  lazy=true,
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("telescope").load_extension("themes")
  end,
}
