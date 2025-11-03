-- /plugins/snippets.lua
-- disabled if below line is active
-- if true then return {} end

---@type LazyPluginSpec
return {
  {
    -- https://github.com/L3MON4D3/LuaSnip
    "L3MON4D3/LuaSnip",
    dependencies = {
      -- https://github.com/rafamadriz/friendly-snippets
      "rafamadriz/friendly-snippets",

      -- add blink.compat to dependencies
      -- https://github.com/saghen/blink.compat
      "saghen/blink.compat",
      version = not vim.g.lazyvim_blink_main and "*",
      optional = true, -- make optional so it's only enabled if any extras need it

      config = function()
        require("luasnip").filetype_extend("c", { "cdoc" })
        require("luasnip.loaders.from_vscode").lazy_load {paths = "./snippets" }
        -- require("luasnip.loaders.from_lua").lazy_load { paths = "./snippets" }
      end,

      opts = {
        delete_check_events = { "TextChanged", "InsertLeave" },
      },
    },
  },
}
