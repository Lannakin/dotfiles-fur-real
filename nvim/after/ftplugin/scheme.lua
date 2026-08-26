-- /after/ftplugin/scheme.lua
-- disabled if below line is active
-- if true then return {} end
-- this is for kicad files.  i don't know if google gemini hallucinated this
-- lol i think it did

local opt = vim.opt_local

vim.filetype.add({
  extension = {
    kicad_pcb = "scheme",
    kicad_sch = "scheme",
    kicad_sym = "scheme",
  },
})

-- --| VIM LOCAL - SCHEME OPTIONS |----------------------------------------------------------------------------------
opt.colorcolumn = "81"
opt.list = false
opt.relativenumber = false
opt.suffixesadd:prepend ".md"

opt.tabstop = 2
opt.textwidth = 80

opt.spell = true
opt.spelllang = "en"

