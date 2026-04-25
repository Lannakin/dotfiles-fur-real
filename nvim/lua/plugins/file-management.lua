-- ./plugins/file-browser.lua
-- disabled if below line is active
-- if true then return {} end

---@type LazySpec
return {
  {
    -- https://github.com/nvim-neo-tree/neo-tree.nvim
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      -- "nvim-lua/plenary.nvim",
      -- "MunifTanjim/nui.nvim",
      { "DaikyXendo/nvim-material-icon", opts = {} },
      { "saifulapm/neotree-file-nesting-config" },
    },
    lazy = true, -- neo-tree will lazily load itself
    ---@module 'neo-tree'
    ---@type neotree.Config
    opts = {
      clipboard = { sync = "universal" },
      -- close_if_last_window = true,
      hide_root_node = true,
      retain_hidden_root_indent = true,

      -- stylua: ignore
      filesystem = {
        filtered_items = {
          visible = true,         -- Makes "hide" mean "dimmed out" instead of completely hidden
          hide_dotfiles = false,  -- Set to false to show dotfiles (hidden files)
          show_hidden_count = false,
          never_show = {
            ".DS_Store",
            "*dropbar*",
          },
        },
      },
      default_component_configs = {
        indent = {
          with_expanders = true,
          expander_collapsed = "",
          expander_expanded = "",
        },
      },
      popup_border_style = "",
      window = {
        position = "left",
        width = 40, -- Set a fixed width
        auto_expand_width = false, -- Prevent auto-expanding
      },
      event_handlers = {
        -- { -- preview selected source
        --   event = "after_render",
        --   handler = function(state)
        --     if not require("neo-tree.sources.common.preview").is_active() then
        --       state.config = { use_float = true }
        --       state.commands.toggle_preview(state)
        --     end
        --   end,
        -- },
        { -- save layout before opening neotree
          event = "neo_tree_window_before_open",
          handler = function()
            -- vim.cmd("set noequalalways")
            local layout = {}
            for _, win in ipairs(vim.api.nvim_list_wins()) do
              layout[win] = {
                height = vim.api.nvim_win_get_height(win),
                width = vim.api.nvim_win_get_width(win),
              }
            end
            vim._neotree_layout = layout
          end,
        },
        { -- restore layout after closing neotree
          event = "neo_tree_window_after_close",
          handler = function()
            ---@diagnostic disable: unnecessary-if
            if vim._neotree_layout then
              for win, dims in pairs(vim._neotree_layout) do
                if vim.api.nvim_win_is_valid(win) then
                  pcall(vim.api.nvim_win_set_height, win, dims.height)
                  pcall(vim.api.nvim_win_set_width, win, dims.width)
                end
              end
            end
          end,
        },
      },
    },
    config = function(_, opts)
      -- Adding rules from plugin
      opts.nesting_rules = require("neotree-file-nesting-config").nesting_rules
      require("neo-tree").setup(opts)
    end,
  },
  {
    -- orig: https://github.com/antosha417/nvim-lsp-file-operations
    -- "antosha417/nvim-lsp-file-operations",
    -- fixes: https://github.com/jinzhongjia/nvim-lsp-file-operations
    "jinzhongjia/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neo-tree/neo-tree.nvim",
    },
    config = function()
      local lspconfig = require "lspconfig"

      -- Set global defaults for all servers
      lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
        capabilities = vim.tbl_deep_extend(
          "force",
          vim.lsp.protocol.make_client_capabilities(),
          -- returns configured operations if setup() was already called
          -- or default operations if not
          require("lsp-file-operations").default_capabilities()
        ),
      })
      require("lsp-file-operations").setup()
    end,
  },
}
