-- /plugins/lsp/python.lua
-- disabled if below line is active
-- if true then return {} end

local function set_python_path(command)
  local path = command.args
  local clients = vim.lsp.get_clients {
    bufnr = vim.api.nvim_get_current_buf(),
    name = "pyright",
  }
  for _, client in ipairs(clients) do
    if client.settings then
      client.settings.python =
        vim.tbl_deep_extend("force", client.settings.python --[[@as table]], { pythonPath = path })
    else
      client.config.settings = vim.tbl_deep_extend("force", client.config.settings, { python = { pythonPath = path } })
    end
    client:notify("workspace/didChangeConfiguration", { settings = nil })
  end
end

return {
  --[[
  --]]
  { -- Add python to treesitter
    -- https://github.com/nvim-treesitter/nvim-treesitter
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "python" } },
  },
  --[[
  { -- Add tools to mason
    -- https://github.com/mason-org/mason.nvim
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "pyright",
      })
    end,
  },
  --]]
  { -- Add python and set up lspconfig
    -- https://github.com/neovim/nvim-lspconfig
    "neovim/nvim-lspconfig",
    dependencies = {},
    opts = {
      servers = {
        pyright = {
          cmd = { "pyright-langserver", "--stdio" },
          settings = {
            python = {
              analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "openFilesOnly",
              },
            },
            diagnostics = { enabled = true },
            filetypes = { "python" },
            root_markers = {
              "pyrightconfig.json",
              "pyproject.toml",
              "setup.py",
              "setup.cfg",
              "requirements.txt",
              "Pipfile",
              ".git",
            },
          },
          on_attach = function(client, bufnr)
            vim.api.nvim_buf_create_user_command(bufnr, "LspPyrightOrganizeImports", function()
              local params = {
                command = "pyright.organizeimports",
                arguments = { vim.uri_from_bufnr(bufnr) },
              }

              -- Using client.request() directly because "pyright.organizeimports" is private
              -- (not advertised via capabilities), which client:exec_cmd() refuses to call.
              -- https://github.com/neovim/neovim/blob/c333d64663d3b6e0dd9aa440e433d346af4a3d81/runtime/lua/vim/lsp/client.lua#L1024-L1030
              ---@diagnostic disable-next-line: param-type-mismatch
              client.request("workspace/executeCommand", params, nil, bufnr)
            end, {
              desc = "Organize Imports",
            })
            vim.api.nvim_buf_create_user_command(bufnr, "LspPyrightSetPythonPath", set_python_path, {
              desc = "Reconfigure pyright with the provided python path",
              nargs = 1,
              complete = "file",
            })
          end,
        },
      },
    },
  },
  {
    -- https://github.com/kiyoon/python-import.nvim
    "kiyoon/python-import.nvim",
    build = "pipx install . --force",
    -- build = "uv tool install . --force --reinstall",
    enabled = false,
    -- keys = {},
    opts = {},
  },
}
