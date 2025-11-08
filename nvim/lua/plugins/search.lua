-- /plugins/search.lua
-- disabled if below line is active
-- if true then return {} end

--- General configuration for spectre base on current git repo
-- src: https://github.com/jellydn/lazy-nvim-ide/blob/main/lua/plugins/spectre.lua
---@param default_opts table | nil
---@return table
function _G.get_spectre_options(default_opts)
  local Path = require("utils.jellydn_path")
  local opts = default_opts or {}

  if Path.is_git_repo() then
    opts.cwd = Path.get_git_root()
  end

  return opts
end

---@type LazySpec
return {
  { -- Search and replace with pattern
    -- https://github.com/nvim-pack/nvim-spectre
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    opts = { open_cmd = "noswapfile vnew" },
    keys = {
      {
        "<leader>Sr",
        function()
          require("spectre").open()
        end,
        desc = "Replace in files",
      },
      {
        "<leader>Sp",
        ":lua require('spectre').open(_G.get_spectre_options())<CR>",
        desc = "Replace in files (Root dir)",
      },
      -- Search current word
      {
        "<leader>SP",
        ":lua require('spectre').open_visual(_G.get_spectre_options({ select_word = true }))<CR>",
        desc = "Replace current word (Root dir)",
      },
      -- Open search with select word in visual mode
      {
        "<leader>Sr",
        ":lua require('spectre').open_visual(_G.get_spectre_options())<CR>",
        mode = "v",
        silent = true,
        desc = "Replace current word (Root dir)",
      },
      -- Search on current file
      {
        "<leader>Sf",
        ":lua require('spectre').open_file_search(_G.get_spectre_options({ select_word = true }))<CR>",
        desc = "Replace in current file",
      },
    },
  },
  {
    --https://github.com/cshuaimin/ssr.nvim
    "cshuaimin/ssr.nvim",
    opts = {
      min_width = 50,
      min_height = 5,
      max_width = 120,
      max_height = 25,
      keymaps = {
        close = "q",
        next_match = "n",
        prev_match = "N",
        replace_confirm = "<cr>",
        replace_all = "<leader><cr>",
      },
    },
    keys = {
      -- Search and replace in current buffer
      {
        "<leader>bs", -- [b]uffer [s]tructural [s]earch and [r]eplace
        function()
          require("ssr").open()
        end,
        desc = "Structural Search and Replace",
      },
    },
  },
}
