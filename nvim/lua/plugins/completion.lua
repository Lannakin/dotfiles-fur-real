-- /plugins/completion.lua
-- disabled if below line is active
-- if true then return {} end
---@diagnostic disable: missing-fields

-- Specify the trigger character(s) used for luasnip
local trigger_text = ";"

return {
  {
    -- https://github.com/Saghen/blink.compat
    "saghen/blink.compat",
    -- lazy.nvim will automatically load the plugin when it's required by blink.cmp
    lazy = true,
    -- make sure to set opts so that lazy.nvim calls blink.compat's setup
    opts = {
      -- print some debug information. Might be useful for troubleshooting
      debug = true,
    },
  },
  {
    -- https://github.com/Saghen/blink.cmp
    "saghen/blink.cmp",
    enabled = true,
    dependencies = {
      { "rafamadriz/friendly-snippets" },
      { "moyiz/blink-emoji.nvim" },
      { "Kaiser-Yang/blink-cmp-dictionary" },
      { "dmitmel/cmp-digraphs" },
    },
    ---@module 'blink.cmp'
    opts = {
      keymap = { preset = "super-tab" },
      sources = {
        per_filetype = {
          -- optionally inherit from the `default` sources
          lua = { inherit_defaults = true, "lazydev" },
        },
      },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100, -- show at a higher priority than lsp
        },
        digraphs = {
          -- IMPORTANT: use the same name as you would for nvim-cmp
          name = "digraphs",
          module = "blink.compat.source",

          -- all blink.cmp source config options work as normal:
          score_offset = -3,
          opts = {
            -- this is an option from cmp-digraphs
            cache_digraphs_on_start = true,

            -- If you'd like to use a `name` that does not exactly match nvim-cmp,
            -- set `cmp_name` to the name you would use for nvim-cmp, for instance:
            -- cmp_name = "digraphs"
            -- then, you can set the source's `name` to whatever you like.
          },
        },
        snippets = {
          opts = {
            friendly_snippets = true, -- default

            -- see the list of frameworks in: https://github.com/rafamadriz/friendly-snippets/tree/main/snippets/frameworks
            -- and search for possible languages in: https://github.com/rafamadriz/friendly-snippets/blob/main/package.json
            -- the following is just an example, you should only enable the frameworks that you use
            extended_filetypes = {
              c = { "cdoc" },
              cpp = { "cdoc" },
              lua = { "luadoc" },
              sh = { "shelldoc" },
            },
          },
        },
        --[[ automaton = {
          name = "automaton.nvim",
          module = "blink.compat.source",
        }, --]]
      },
    },
  },
}
