-- /plugins/context.lua
-- disabled if below line is active
-- if true then return {} end
-- ---@diagnostic disable:undefined-global, unused
return {
  {
    -- https://github.com/nvim-treesitter/nvim-treesitter-context
    "nvim-treesitter/nvim-treesitter-context",
    event = "LazyFile",
    opts = function()
      local tsc = require "treesitter-context"
      return { mode = "cursor", max_lines = 3 }
    end,
  },
  {
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

      add "git_config"

  --[[ if have "hypr" then
        add "hyprlang"
      end

      if have "fish" then
        add "fish"
      end

      if have "rofi" or have "wofi" then
        add "rasi"
      end --]]
    end,
  },
}
