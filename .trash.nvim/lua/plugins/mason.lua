-- /plugins/mason.lua
-- disabled if below line is active
-- if true then return {} end
-- https://github.com/mason-org/mason.nvim
return {
  "mason-org/mason.nvim",
  cmd = "Mason",
  -- opts_extend = { "ensure_installed" },
  opts = {
    ensure_installed = {
      "emmylua_ls",
      "stylua",
      "shfmt",
    },
  },
}
