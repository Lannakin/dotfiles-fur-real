-- plugins/buffer-layout.lua
-- disabled if below line is active
-- if true then return {} end
---@diagnostic disable: missing-fields

---@type LazySpec
return {
  -- --| splits |------------------------------------------------------------------------------------------------------
  {
    -- https://github.com/mrjones2014/smart-splits.nvim
    "mrjones2014/smart-splits.nvim",
    -- to use Kitty multiplexer support, run the post install hook
    build = "./kitty/install-kittens.bash",
    opts = {
      -- ignored_filetypes = { "NvimTree", "neo-tree" },
    },
  },
}
