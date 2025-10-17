-- disabled if below line is active
-- if true then return {} end
-- https://github.com/amrbashir/nvim-docs-view
return {
  "amrbashir/nvim-docs-view",
  lazy = true,
  cmd = "DocsViewToggle",
  opts = {
    position = "right",
    width = 60
  }
}