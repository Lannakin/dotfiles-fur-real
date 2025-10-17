-- disabled if below line is active
-- if true then return {} end
-- https://github.com/MeanderingProgrammer/render-markdown.nvim/wiki
require("render-markdown").setup({
  preset = "lazy",
  latex = { enabled = false },
})

return {
  'MeanderingProgrammer/render-markdown.nvim',
  ft = { 'markdown', 'quarto' },
}