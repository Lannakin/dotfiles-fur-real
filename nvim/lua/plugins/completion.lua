-- /plugins/completion.lua
-- disabled if below line is active
-- if true then return {} end
---@diagnostic disable: missing-fields
---@module "lazy"

-- +---------------------------------------------------------+
-- |                 neovim text completion                  |
-- +---------------------------------------------------------+

-- Specify the trigger character(s) used for luasnip
-- local trigger_text = ";"

---@type LazySpec
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
  { -- use blink.cmp for command-line completion
    -- https://github.com/Saghen/blink.cmp
    "saghen/blink.cmp",
    enabled = true,
    dependencies = {
      { "rafamadriz/friendly-snippets" },
      { "moyiz/blink-emoji.nvim" },
      { "Kaiser-Yang/blink-cmp-dictionary" },
      { "dmitmel/cmp-digraphs" },
      { "L3MON4D3/LuaSnip" },
    },
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      fuzzy = { implementation = "lua" },
      keymap = { -- note: these do not apply to cmdline unless cmdline.keymap.preset = "inherit"
        preset = "super-tab",
        -- disable keymaps: https://cmp.saghen.dev/configuration/keymap.html
        ["<C-p>"] = {}, -- { 'select_prev', 'fallback_to_mappings' }
        ["<C-n>"] = {}, -- { 'select_next', 'fallback_to_mappings' }
        ["<C-b>"] = {}, -- { 'scroll_documentation_up', 'fallback' }
        ["<C-f>"] = {}, -- { 'scroll_documentation_down', 'fallback' }
        ["<C-k>"] = {}, -- { 'show_signature', 'hide_signature', 'fallback' }
        -- the rest of the binds
        -- ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        -- ['<C-e>'] = { 'hide', 'fallback' },

        -- ['<Tab>'] = {  function(cmp) if cmp.snippet_active() then return cmp.accept()
        --     else return cmp.select_and_accept() end end, 'snippet_forward', 'fallback' },
        -- ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
        -- ['<Up>'] = { 'select_prev', 'fallback' },
        -- ['<Down>'] = { 'select_next', 'fallback' },
      },
      completion = {
        ghost_text = { enabled = false },
        list = { selection = { preselect = false, auto_insert = true } },
      },
      cmdline = {
        enabled = true,
        keymap = { preset = "inherit" },
        completion = { menu = { auto_show = true } },
      },
      sources = { -- add lazydev to blink.cmp completion providers
        default = { "buffer", "cmdline", "digraphs", "lazydev", "lsp", "path", "snippets" }, -- do not put luasnip here
        providers = {
          -- buffers = {},
          -- cmdline = {},

          -- create provider
          digraphs = {
            -- IMPORTANT: use the same name as you would for nvim-cmp
            name = "digraphs",
            module = "blink.compat.source",
            score_offset = -3,
            opts = {
              cache_digraphs_on_start = true, -- this is an option from cmp-digraphs

              -- If you'd like to use a `name` that does not exactly match nvim-cmp,
              -- set `cmp_name` to the name you would use for nvim-cmp, for instance:
              -- cmp_name = "digraphs"
              -- then, you can set the source's `name` to whatever you like.
            },
          },
          lazydev = { name = "LazyDev", module = "lazydev.integrations.blink", score_offset = 100 },
          -- lsp = {},
          -- path = {},
          snippets = { enabled = true },
          --[[
          -- stylua: ignore start
          buffer = { enabled = false },   -- +---------------------------------------------------------+
          lsp = { enabled = false },      -- |                                                         |
          luasnip = { enabled = false },  -- |   disable these if using coc.nvim for non-cmdline cmp   |
          path = { enabled = false },     -- |                                                         |
          snippets = { enabled = false }, -- +---------------------------------------------------------+
          -- stylua: ignore end
          cmdline = {
            module = "blink.cmp.sources.cmdline",
          },
          --]]
        },
      },
    },
  },
  -- { -- good luck ever using this in tandem with blink.cmp or with the cmdline
  --   -- https://github.com/neoclide/coc.nvim
  --   "neoclide/coc.nvim",
  --   branch = "master",
  --   build = "npm ci",
  -- },
}
