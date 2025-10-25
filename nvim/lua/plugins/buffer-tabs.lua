-- /plugins/buffer-tabs.lua
-- disabled if below line is active
-- if true then return {} end
return {
  {
    -- https://github.com/nanozuki/tabby.nvim
    "nanozuki/tabby.nvim",
    ---@type TabbyConfig
    opts = {
      -- configs...
    },
  },
  -- https://github.com/akinsho/bufferline.nvim
  {
    "akinsho/bufferline.nvim",
    opts = {
      enabled = false,
      options = {
        separator_style = { " ", " " },
      },
      highlights = {
        buffer_selected = { italic = false, bold = false },
      },
    },
    --[[    config = function(_, opts)
      require("bufferline").setup(opts)
      -- Fix bufferline when restoring a session
      vim.api.nvim_create_autocmd("BufAdd", {
        callback = function()
          vim.schedule(function()
            pcall(nvim_bufferline)
          end)
        end,
      })
    end, --]]
  },
}
