-- /plugins/completion.lua
-- disabled if below line is active
-- if true then return {} end
---@diagnostic disable: missing-fields

-- Specify the trigger character(s) used for luasnip
-- local trigger_text = ";"

---@type LazyPluginSpec[]
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
    },
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      fuzzy = { implementation = "lua" },
      keymap = { preset = "super-tab" },
      completion = {
        sources = {
          -- providers = {
          --   buffer = {
          --     enabled = false,
          --   },
          --   lsp = {
          --     enabled = false,
          --   },
          --   luasnip = {
          --     enabled = false,
          --   },
          --   path = {
          --     enabled = false,
          --   },
          --   snippets = {
          --     enabled = false,
          --   },
          -- },
        },
        list = {
          selection = {
            preselect = false,
            auto_insert = true,
          },
        },
      },
      cmdline = {
        keymap = {
          -- preset = "super-tab",
          -- ['<Tab>'] = { 'accept' },
          -- ['<CR>'] = { 'accept_and_enter', 'fallback' },
          ["<Tab>"] = { "show_and_insert_or_accept_single", "select_next" },
          ["<S-Tab>"] = { "show_and_insert_or_accept_single", "select_prev" },
        },
        completion = {
          menu = {
            auto_show = true,
            -- auto_show = function()
            --   return vim.fn.getcmdtype() == ':'
            -- end
          },
        },
      },
    },
  },
  -- {
  --   -- https://github.com/neoclide/coc.nvim
  --   "neoclide/coc.nvim",
  --   branch = "master",
  --   build = "npm ci",
  -- },
}
