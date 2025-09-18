-- ~/.config/yazi/init.lua

-- full-border
require("full-border"):setup{
    type = ui.Border.PLAIN
}

-- https://github.com/wylie102/duckdb.yazi
require("duckdb"):setup({
  mode = "standard",
  cache_size = 1000,
  row_id = "dynamic",
  minmax_column_width = int,
  column_fit_factor = float
})