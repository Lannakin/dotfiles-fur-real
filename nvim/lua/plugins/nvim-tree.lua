if true then return {} end
-- https://github.com/nvim-tree/nvim-tree.lua
return {
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require('config.nvim-tree')
        end
    }
}