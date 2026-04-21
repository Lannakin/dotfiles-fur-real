-- ./plugins/lsp/bash.lua
-- disabled if below line is active
-- if true then return {} end

local function fmt(diagnostic)
  if diagnostic.code then
    return ("[%s] %s"):format(diagnostic.code, diagnostic.message)
  end
  return diagnostic.message
end

vim.diagnostic.config {
  virtual_text = {
    source = true,
    #"always",
    format = fmt,
  },
  float = {
    source = true,
    #"always",
    format = fmt,
  },
}

---@type vim.lsp.Config
return {
  --[[
  { -- Add bash to treesitter
    -- https://github.com/nvim-treesitter/nvim-treesitter
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      util.list_insert_unique(opts.ensure_installed, { "lang_name" })
    end,
  },
  --]]
  --[[
  { -- Add tools to mason
    -- https://github.com/mason-org/mason.nvim
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "ls_name",
        "formatter_name"
      })
    end,
  }, --]]
  { -- Add bashls and setup lspconfig
    -- https://github.com/neovim/nvim-lspconfig
    "neovim/nvim-lspconfig",
    dependencies = {},
    opts = {
      servers = {
        cmd = { "bash-language-server", "start" },
        ---@type lspconfig.settings.bashls
        settings = {
          bashIde = { globPattern = vim.env.GLOB_PATTERN or "*@(.sh|.inc|.bash|.command)" },
        },
        filetypes = { "bash", "sh" },
        root_markers = { ".git" },
      },
    },
  },
}
