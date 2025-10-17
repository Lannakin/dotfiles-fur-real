-- if true then return {} end
return {
  "nyarthan/telescope-code-actions.nvim",
  -- build = "make",
  lazy=true,
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
}