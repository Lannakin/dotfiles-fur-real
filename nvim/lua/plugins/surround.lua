-- /plugins/surround.lua
-- disabled if below line is active
-- if true then return {} end
return {
  {
    -- https://github.com/nvim-mini/mini.surround"
    "nvim-mini/mini.surround",
    opts = {
      mappings = {
        add = "",               -- Add surrounding in Normal and Visual modes - removed
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
