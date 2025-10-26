-- /plugins/render-markdown.lua
-- disabled if below line is active
-- if true then return {} end
-- https://github.com/MeanderingProgrammer/render-markdown.nvim/wiki
return {
  "MeanderingProgrammer/render-markdown.nvim",
  opts = {
    ft = { "markdown", "quarto" },
    preset = "lazy",
    latex = { enabled = false },
  },
  config = function(_, opts)
    require("render-markdown").setup(opts)
  end,
}
