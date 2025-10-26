-- /plugins/smart-splits.lua
-- disabled if below line is active
-- if true then return {} end
return {
  -- to use Kitty multiplexer support, run the post install hook
  {
    "mrjones2014/smart-splits.nvim",
    build = "./kitty/install-kittens.bash",
  },
}
