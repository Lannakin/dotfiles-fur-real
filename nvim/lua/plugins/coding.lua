-- /plugins/coding.lua
-- disabled if below line is active
-- if true then return {} end
-- ---@diagnostic disable:undefined-global, unused

-- [ v for mini.surround v ] --
vim.keymap.set({ "n", "x" }, "s", "<Nop>")
vim.o.timeoutlen = 3000 -- increase timeout b/c slow
-- [ ^ for mini.surround ^ ] --

---@type LazyPluginSpec[]
return {
  {
    "cuducos/spellfile.nvim",
    enabled = true,
    ft = { 'markdown', 'text' },
  },
  { -- add dotfile parsing to nvim-treesitter
    -- https://github.com/nvim-treesitter/nvim-treesitter
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      local function add(lang)
        if type(opts.ensure_installed) == "table" then
          table.insert(opts.ensure_installed, lang)
        end
      end

      vim.filetype.add {
        extension = { rasi = "rasi", rofi = "rasi", wofi = "rasi" },
        filename = {
          ["vifmrc"] = "vim",
        },
        pattern = {
          [".*/waybar/config"] = "jsonc",
          [".*/mako/config"] = "dosini",
          [".*/kitty/.+%.conf"] = "kitty",
          [".*/hypr/.+%.conf"] = "hyprlang",
          ["%.env%.[%w_.-]+"] = "sh",
        },
      }
      vim.treesitter.language.register("bash", "kitty")

      add ("git_config")

      -- if have("hypr") then
      --   add("hyprlang")
      -- end
      --
      -- if have("fish") then
      --   add("fish")
      -- end
      --
      -- if have "rofi" or have "wofi" then
      --   add "rasi"
      -- end
    end,
  },
  {
    -- https://github.com/nvim-treesitter/nvim-treesitter-context
    "nvim-treesitter/nvim-treesitter-context",
    event = "LazyFile",
    opts = function()
      -- local tsc = require "treesitter-context"
      return { mode = "cursor", max_lines = 3 }
    end,
  },
  -- {
  --   -- https://github.com/nvim-mini.ai
  --   "nvim-mini/mini.ai",
  --   opts = function()
  --     return {
  --       -- Table with textobject id as fields, textobject specification as values.
  --       -- Also use this to disable builtin textobjects. See |MiniAi.config|.
  --       custom_textobjects = nil,
  --
  --       -- Module mappings. Use `''` (empty string) to disable one.
  --       mappings = {
  --         -- Main textobject prefixes
  --         around = "",
  --         inside = "",
  --
  --         -- Next/last variants
  --         -- NOTE: These override built-in LSP selection mappings on Neovim>=0.12
  --         -- Map LSP selection manually to use it (see `:h MiniAi.config`)
  --         around_next = "",
  --         inside_next = "",
  --         around_last = "",
  --         inside_last = "",
  --
  --         -- Move cursor to corresponding edge of `a` textobject
  --         goto_left = "",
  --         goto_right = "",
  --       },
  --     }
  --   end,
  -- },
  {
    -- https://github.com/nvim-mini/mini.surround"
    "nvim-mini/mini.surround",
    ---@type LazyKeysSpec
    keys = function(_, keys)
      -- Populate the keys based on the user's options
      local opts = LazyVim.opts "mini.surround"
      local mappings = {
        { opts.mappings.add, desc = "Add Surrounding", mode = { "n", "x" } },
        { opts.mappings.delete, desc = "Delete Surrounding" },
        { opts.mappings.find, desc = "Find Right Surrounding" },
        { opts.mappings.find_left, desc = "Find Left Surrounding" },
        { opts.mappings.highlight, desc = "Highlight Surrounding" },
        { opts.mappings.replace, desc = "Replace Surrounding" },
        { opts.mappings.update_n_lines, desc = "Update `MiniSurround.config.n_lines`" },
      }

      mappings = vim.tbl_filter(function(m)
        return m[1] and #m[1] > 0
      end, mappings)
      return vim.list_extend(mappings, keys)
    end,
    opts = {
      mappings = {
        add = "s",             -- Add surrounding in Normal and Visual modes - removed
        delete = "sd",         -- Delete surrounding
        find = "sf",           -- Find surrounding (to the right)
        find_left = "sF",      -- Find surrounding (to the left)
        highlight = "sh",      -- Highlight surrounding
        replace = "sr",        -- Replace surrounding
        update_n_lines = "sn", -- Update `n_lines`
      },
    },
  },
}
