-- /plugins/terminal.lua
-- disabled if below line is active
-- if true then return {} end

---@type LazyPluginSpec[]
return {
  {
    -- https://github.com/mikesmithgh/kitty-scrollback
    "mikesmithgh/kitty-scrollback.nvim",
    enabled = true,
    lazy = true,
    cmd = {
      "KittyScrollbackGenerateKittens",
      "KittyScrollbackCheckHealth",
      "KittyScrollbackGenerateCommandLineEditing",
    },
    event = { "User KittyScrollbackLaunch" },
    version = "*", -- latest stable version, may have breaking changes if major version changed
    opts = {},
    config = function(_, opts)
      require("kitty-scrollback").setup(opts)
    end,
  },
}
