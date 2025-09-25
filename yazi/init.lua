-- ~/.config/yazi/init.lua

-- https://github.com/AnirudhG07/awesome-yazi
-- plugin list

-- https://github.com/yazi-rs/plugins/tree/main/full-border.yazi
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

require("omp"):setup({ config = "~/.config/oh-my-posh/catppuccin_solarized-light.omp.json" })

-- https://github.com/saumyajyoti/omp.yazi
-- yazi + oh-my-posh
-- probably don't use with yatline
-- require("omp"):setup()
-- or

-- #=====================# --
-- #   YATLINE SECTION   # --
-- #=====================# --

local solarized_theme = require("yatline-solarized"):setup("light") -- or "dark"

require("yatline"):setup({
  theme = solarized_theme,
	-- section_separator = { open = "", close = "" },
	-- part_separator = { open = "", close = "" },
	-- inverse_separator = { open = "", close = "" },

	-- style_a = {
	-- 	fg = "black",
	-- 	bg_mode = {
	-- 		normal = "white",
	-- 		select = "brightyellow",
	-- 		un_set = "brightred"
	-- 	}
	-- },
	-- style_b = { bg = "brightblack", fg = "brightwhite" },
	-- style_c = { bg = "black", fg = "brightwhite" },

	-- permissions_t_fg = "green",
	-- permissions_r_fg = "yellow",
	-- permissions_w_fg = "red",
	-- permissions_x_fg = "cyan",
	-- permissions_s_fg = "white",

	tab_width = 20,
	tab_use_inverse = false,

	-- selected = { icon = "󰻭", fg = "yellow" },
	-- copied = { icon = "", fg = "green" },
	-- cut = { icon = "", fg = "red" },

	-- total = { icon = "󰮍", fg = "yellow" },
	-- succ = { icon = "", fg = "green" },
	-- fail = { icon = "", fg = "red" },
	-- found = { icon = "󰮕", fg = "blue" },
	-- processed = { icon = "󰐍", fg = "green" },

	show_background = true,

	display_header_line = true,
	display_status_line = true,

	component_positions = { "header", "tab", "status" },

	-- header_line = {
	-- 	left = {
	-- 		section_a = {
  --       {type = "line", custom = false, name = "tabs", params = {"left"}}
	-- 		},
	-- 		section_b = {
  --       {type = "coloreds", custom = false, name = "hostname_username"}
	-- 		},
	-- 		section_c = {
	-- 		}
	-- 	},
	-- 	right = {
	-- 		section_a = {
  --       {type = "coloreds", custom = false, name = "created_time",}
	-- 		},
	-- 		section_b = {

	-- 		},
	-- 		section_c = {
  --       {type = "coloreds", custom = false, name = "modified-time",}
	-- 		}
	-- 	}
	-- },

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
        -- {type = "coloreds", custom = false, name = "created_time"}
        -- {type = "string", custom = false, name = "cursor_position"}
			},
			section_b = {
        { type = "string", custom = false, name = "cursor_position" }
        -- {type = "coloreds", custom = false, name = "modified-time"}
			},
			section_c = {
        {type = "string", custom = false, name = "hovered_file_extension", params = {true}},
        {type = "coloreds", custom = false, name = "permissions"}
			}
		}
	},
})

require("yatline-modified-time"):setup({
  modified_time_color = "black",
})

require("yatline-created-time"):setup({
  created_time_color = "black",
})
require("yatline-hostname-username"):setup({
  color = "silver",
  mode = "both" -- "host", "user", "both"
})
-- #=====================# --
-- # END YATLINE SECTION # --
-- #=====================# --
