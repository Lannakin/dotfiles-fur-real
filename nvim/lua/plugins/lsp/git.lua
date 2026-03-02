-- ./plugins/lsp/git.lua
-- disabled if below line is active
-- if true then return {} end

return {
  -- --| git syntax |--------------------------------------------------------------------------------------------------
  {
  "nvim-treesitter/nvim-treesitter",
  opts = { ensure_installed = { "git_config", "gitcommit", "git_rebase", "gitignore", "gitattributes" } },
  },
}
