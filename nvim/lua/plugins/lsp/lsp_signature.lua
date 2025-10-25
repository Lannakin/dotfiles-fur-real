-- /plugins/lsp_signature.lua
-- disabled if below line is active
-- if true then return {} end
-- https://github.com/ray-x/lsp_signature.nvim
return {
  "ray-x/lsp_signature.nvim",
  event = "InsertEnter",
  opts = {
    handler_opts = {
       border = "single"
    }
  },
}
