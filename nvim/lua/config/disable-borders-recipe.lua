if true then return {} end

local border_type = "single"

return {
  --[[
  {
    "akinsho/toggleterm.nvim",
    optional = true,
    opts = {
      float_opts = { border = border_type },
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    optional = true,
    opts = {
      floating = { border = border_type },
    },
  },
  {
    "Saghen/blink.cmp",
    optional = true,
    opts = {
      completion = {
        menu = { border = border_type },
        documentation = { window = { border = border_type } },
      },
      signature = { window = { border = border_type } },
    },
  },
  ]]

}