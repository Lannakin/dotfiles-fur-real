-- /plugins/snippets.lua
-- disabled if below line is active
-- if true then return {} end

---@type LazySpec
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
    },
    -- version = not vim.g.lazyvim_blink_main and "*",
    optional = true, -- make optional so it's only enabled if any extras need it

    config = function()
      require("luasnip").filetype_extend("c", { "cdoc" })
      require("luasnip.loaders.from_vscode").lazy_load ({ paths = "./snippets" })
    end,

    opts = {
      delete_check_events = { "TextChanged", "InsertLeave" },
    },
  },
  { -- https://cht.sh/ integration
    -- https://github.com/siawkz/nvim-cheatsh
    "siawkz/nvim-cheatsh",
    dependencies = { "ibhagwan/fzf-lua", dependencies = { "DaikyXendo/nvim-material-icon" } },
    -- stylua: ignore
    opts = {
      cheatsh_url = "https://cht.sh/", -- URL of the cheat.sh instance to use, support self-hosted instances
      position = "bottom",             -- position of the window can be: bottom, top, left, right
      height = 20,                     -- height of the cheat when position is top or bottom
      width = 100,                     -- width of the cheat when position is left or right
    },
  },
}
