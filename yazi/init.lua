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

-- https://github.com/saumyajyoti/omp.yazi
-- yazi + oh-my-posh
-- probably don't use with yatline
-- require("omp"):setup({ config = "~/.config/oh-my-posh/catppuccin_solarized-light.omp.json" })

-- #=====================# --
-- #   YATLINE SECTION   # --
-- #=====================# --
--
--
local solarized_theme = require("yatline-solarized"):setup("light") -- or "dark"

require("yatline"):setup({
  theme = solarized_theme,
  section_separator = { open = "", close = "" },
  part_separator = { open = "", close = "" },
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

	tab_width = 20,
	tab_use_inverse = false,

	show_background = true,

	display_header_line = true,
	display_status_line = true,

	component_positions = { "header", "tab", "status" },

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
        -- {type = "coloreds", custom = false, name = "created_time",}
			},
			section_b = {

			},
			section_c = {
        -- {type = "coloreds", custom = false, name = "modified-time",}
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
        -- {type = "coloreds", custom = false, name = "created_time"}
        {type = "string", custom = false, name = "cursor_position"}
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
  modified_time_color = "silver",
})

require("yatline-created-time"):setup({
  created_time_color = "silver",
})
require("yatline-hostname-username"):setup({
  color = "silver",
  mode = "both" -- "host", "user", "both"
})
-- #=====================# --
-- # END YATLINE SECTION # --
-- #=====================# --

-- #====================# --
-- #   WHOOSH SECTION   # --
-- #====================# --
-- https://github.com/WhoSowSee/whoosh.yazi
-- You can configure your bookmarks using simplified syntax
local bookmarks = {
  { tag = "Desktop",   path = "~/Desktop",   key = "d" },
  { tag = "Documents", path = "~/Documents", key = "D" },
  { tag = "Downloads", path = "~/Downloads", key = "o" },
}

-- You can also configure bookmarks with key arrays
local bookmarks = {
  { tag = "Desktop",   path = "~/Desktop",   key = { "d", "D" } },
  { tag = "Documents", path = "~/Documents", key = { "d", "d" } },
  { tag = "Downloads", path = "~/Downloads", key = "o" },
}

-- Windows-specific bookmarks
if ya.target_family() == "windows" then
  local home_path = os.getenv("USERPROFILE")
  table.insert(bookmarks, {
    tag = "Scoop Local",
    path = os.getenv("SCOOP") or (home_path .. "\\scoop"),
    key = "p"
  })
  table.insert(bookmarks, {
    tag = "Scoop Global",
    path = os.getenv("SCOOP_GLOBAL") or "C:\\ProgramData\\scoop",
    key = "P"
  })
end

require("whoosh"):setup {
  -- Configuration bookmarks (cannot be deleted through plugin)
  bookmarks = bookmarks,

  -- Notification settings
  jump_notify = false,

  -- Key generation for auto-assigning bookmark keys
  keys = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",

  -- File path for storing user bookmarks
  path = (ya.target_family() == "windows" and os.getenv("APPDATA") .. "\\yazi\\config\\bookmark") or
      (os.getenv("HOME") .. "/.config/yazi/bookmark"),

  -- Path truncation in navigation menu
  path_truncate_enabled = false, -- Enable/disable path truncation
  path_max_depth = 3,            -- Maximum path depth before truncation

  -- Path truncation in fuzzy search (fzf)
  fzf_path_truncate_enabled = false, -- Enable/disable path truncation in fzf
  fzf_path_max_depth = 5,            -- Maximum path depth before truncation in fzf

  -- Long folder name truncation
  path_truncate_long_names_enabled = false,     -- Enable in navigation menu
  fzf_path_truncate_long_names_enabled = false, -- Enable in fzf
  path_max_folder_name_length = 20,             -- Max length in navigation menu
  fzf_path_max_folder_name_length = 20,         -- Max length in fzf

  -- History directory settings
  history_size = 10,                                    -- Number of directories in history (default 10)
  history_fzf_path_truncate_enabled = false,            -- Enable/disable path truncation by depth for history
  history_fzf_path_max_depth = 5,                       -- Maximum path depth before truncation for history (default 5)
  history_fzf_path_truncate_long_names_enabled = false, -- Enable/disable long folder name truncation for history
  history_fzf_path_max_folder_name_length = 30,         -- Maximum length for folder names in history (default 30)
}
-- #====================# --
-- # END WHOOSH SECTION # --
-- #====================# --
