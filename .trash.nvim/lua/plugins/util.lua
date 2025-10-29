-- /plugins/util.lua
-- disabled if below line is active
-- if true then return {} end
-- https://github.com/dpetka2001/dotfiles/blob/main/dot_config/nvim/lua/plugins/util.lua Commits on May 14, 2023
return {
  {
    -- https://github.com/tpope/vim-repeat
    "tpope/vim-repeat",
    lazy = true,
    -- use function to overwrite default event, otherwise it just merges with the default
    -- and `VeryLazy` keeps existing
    event = function()
      return { "BufReadPost", "BufNewFile" }
    end,
  },
}
