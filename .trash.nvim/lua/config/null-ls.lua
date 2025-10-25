-- /config/null-ls.lua

-- disabled if below line is active
if true then return {} end

-- should this really be called separately???

require("mason").setup()
require("mason-null-ls").setup({
  automatic_installation = {},
  ensure_installed = {},
  handlers = {},
})

