-- /after/ftplugin/conf.lua
local opt = vim.opt_local

opt.colorcolumn = "120"
opt.commentstring = '#%s'
opt.formatoptions:remove({ 'r', 'o' })
opt.iskeyword:append('_')
opt.list = true
opt.spell = false
