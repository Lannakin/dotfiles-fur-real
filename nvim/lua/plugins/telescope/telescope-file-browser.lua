-- if true then return {} end
return {
  "nvim-telescope/telescope-file-browser.nvim",
  build = "make",
  lazy=true,
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
  },
}
