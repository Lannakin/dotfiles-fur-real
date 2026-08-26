-- ./plugins/lsp/systemd.lua
-- disabled if below line is active
-- if true then return {} end
-- src: https://github.com/neovim/nvim-lspconfig/blob/master/lsp/systemd_lsp.lua

local function populate_table(t)
  local tmp = {}
  for filetype, files in pairs(t) do
    for _, file in pairs(files) do
      tmp[file] = filetype
    end
  end
  return tmp
end

--defines systemd and podman quadlet filetypes
local ext_patterns = {
  systemd = {
    "conf",
    "service",
    "socket",
    "timer",
    "mount",
    "automount",
    "swap",
    "target",
    "path",
    "slice",
    "scope",
    "device",
  },
  podman = {
    "container",
    "volume",
    "network",
    "kube",
    "pod",
    "build",
    "image",
  },
}

vim.filetype.add {
  extension = populate_table(ext_patterns),
  -- filename = {},
  pattern = { ["[^/]+%.d/%d+-[^/]+%.conf"] = "systemd" },
  -- pattern = {},
}

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      ---@type vim.lsp.Config
      servers = {
        systemd_lsp = {
          cmd = { "systemd-lsp" },
          enabled = true,
          filetypes = { "systemd" },
        },
      },
    },
  },
}
