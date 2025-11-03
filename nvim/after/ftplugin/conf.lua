-- /after/ftplugin/conf.lua
-- disabled if below line is active
-- if true then return {} end

local opt = vim.opt_local

opt.colorcolumn = "120"
opt.commentstring = '#%s'
opt.formatoptions:remove({ 'r', 'o' })
opt.iskeyword:append('_')
opt.list = true
opt.spell = false
