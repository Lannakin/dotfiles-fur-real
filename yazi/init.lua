-- ~/.config/yazi/init.lua

-- -- full-border
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

require("yatline"):setup({
	show_background = false,

	header_line = {
		left = {
			section_a = {
        {type = "line", custom = false, name = "tabs", params = {"left"}}
			},
			section_b = {
        {type = "coloreds", custom = false, name = "hostname_username"}
			},
			section_c = {
			}
		},
		right = {
			section_a = {
        {type = "coloreds", custom = false, name = "created_time"}
			},
			section_b = {
        {type = "coloreds", custom = false, name = "modified-time"}
			},
			section_c = {
			}
		}
	},

	status_line = {
		left = {
			section_a = {
        {type = "string", custom = false, name = "tab_mode"}
			},
			section_b = {
        {type = "string", custom = false, name = "hovered_size"}
			},
			section_c = {
        {type = "string", custom = false, name = "hovered_path"},
        {type = "coloreds", custom = false, name = "count"}
			}
		},
		right = {
			section_a = {
        {type = "string", custom = false, name = "cursor_position"}
			},
			section_b = {
        {type = "string", custom = false, name = "cursor_percentage"}
			},
			section_c = {
        {type = "string", custom = false, name = "hovered_file_extension", params = {true}},
        {type = "coloreds", custom = false, name = "permissions"}
			}
		}
	},
})

require("yatline-created-time"):setup( )
require("yatline-modified-time"):setup( )

require("yatline-hostname-username"):setup({
  color = "silver",
  mode = "both" -- "host", "user", "both"
})