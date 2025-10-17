-- if true then return {} end
-- https://github.com/nvim-telescope/telescope.nvim original
-- https://github.com/DrKJeff16/telescope.nvim

local telescopeConfig = require("telescope.config")
local Layout = require("nui.layout")
local Popup = require("nui.popup")

local TSLayout = require("telescope.pickers")

local function make_popup(options)
  local popup = Popup(options)
  ---@class NuiPopup.border
  function popup.border:change_title(title)
    popup.border.set_text(popup.border, "top", title)
  end
  return TSLayout.Window(popup)
end

-- Clone the default Telescope configuration
-- local unpack = unpack or table.unpack
table.unpack = table.unpack or unpack -- 5.1 compatibility
local vimgrep_arguments = { table.unpack(telescopeConfig.values.vimgrep_arguments) }

-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, "--hidden")
-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")

require("telescope").setup({
  lazy = false,
  defaults = {
    -- `hidden = true` is not supported in text grep commands.
    vimgrep_arguments = vimgrep_arguments,
    layout_strategy = "flex",
    layout_config = {
      horizontal = {
        size = {
          width = "90%",
          height = "60%",
        },
      },
      vertical = {
        size = {
          width = "90%",
          height = "90%",
        },
      },
      create_layout = function(picker)
        local border = {
          results = {
            top_left = "┌",
            top = "─",
            top_right = "┬",
            right = "│",
            bottom_right = "",
            bottom = "",
            bottom_left = "",
            left = "│",
          },
          results_patch = {
            minimal = {
              top_left = "┌",
              top_right = "┐",
            },
            horizontal = {
              top_left = "┌",
              top_right = "┬",
            },
            vertical = {
              top_left = "├",
              top_right = "┤",
            },
          },
          prompt = {
            top_left = "├",
            top = "─",
            top_right = "┤",
            right = "│",
            bottom_right = "┘",
            bottom = "─",
            bottom_left = "└",
            left = "│",
          },
          prompt_patch = {
            minimal = {
              bottom_right = "┘",
            },
            horizontal = {
              bottom_right = "┴",
            },
            vertical = {
              bottom_right = "┘",
            },
          },
          preview = {
            top_left = "┌",
            top = "─",
            top_right = "┐",
            right = "│",
            bottom_right = "┘",
            bottom = "─",
            bottom_left = "└",
            left = "│",
          },
          preview_patch = {
            minimal = {},
            horizontal = {
              bottom = "─",
              bottom_left = "",
              bottom_right = "┘",
              left = "",
              top_left = "",
            },
            vertical = {
              bottom = "",
              bottom_left = "",
              bottom_right = "",
              left = "│",
              top_left = "┌",
            },
          },
        }

        local results = make_popup({
          focusable = false,
          border = {
            style = border.results,
            text = {
              top = picker.results_title,
              top_align = "center",
            },
          },
          win_options = {
            winhighlight = "Normal:Normal",
          },
        })

        local prompt = make_popup({
          enter = true,
          border = {
            style = border.prompt,
            text = {
              top = picker.prompt_title,
              top_align = "center",
            },
          },
          win_options = {
            winhighlight = "Normal:Normal",
          },
        })

        local preview = make_popup({
          focusable = false,
          border = {
            style = border.preview,
            text = {
              top = picker.preview_title,
              top_align = "center",
            },
          },
        })

        local box_by_kind = {
          vertical = Layout.Box({
            Layout.Box(preview, { grow = 1 }),
            Layout.Box(results, { grow = 1 }),
            Layout.Box(prompt, { size = 3 }),
          }, { dir = "col" }),
          horizontal = Layout.Box({
            Layout.Box({
              Layout.Box(results, { grow = 1 }),
              Layout.Box(prompt, { size = 3 }),
            }, { dir = "col", size = "50%" }),
            Layout.Box(preview, { size = "50%" }),
          }, { dir = "row" }),
          minimal = Layout.Box({
            Layout.Box(results, { grow = 1 }),
            Layout.Box(prompt, { size = 3 }),
          }, { dir = "col" }),
        }

        local function get_box()
          local strategy = picker.layout_strategy
          if strategy == "vertical" or strategy == "horizontal" then
            return box_by_kind[strategy], strategy
          end

          local height, width = vim.o.lines, vim.o.columns
          local box_kind = "horizontal"
          if width < 100 then
            box_kind = "vertical"
            if height < 40 then
              box_kind = "minimal"
            end
          end
          return box_by_kind[box_kind], box_kind
        end

        local function prepare_layout_parts(layout, box_type)
          layout.results = results
          results.border:set_style(border.results_patch[box_type])

          layout.prompt = prompt
          prompt.border:set_style(border.prompt_patch[box_type])

          if box_type == "minimal" then
            layout.preview = nil
          else
            layout.preview = preview
            preview.border:set_style(border.preview_patch[box_type])
          end
        end

        local function get_layout_size(box_kind)
          return picker.layout_config[box_kind == "minimal" and "vertical" or box_kind].size
        end

        local box, box_kind = get_box()
        local layout = Layout({
          relative = "editor",
          position = "50%",
          size = get_layout_size(box_kind),
        }, box)
        ---@class layout
        layout.picker = picker
        prepare_layout_parts(layout, box_kind)

        local layout_update = layout.update
        function layout:update()
          local box, box_kind = get_box()
          prepare_layout_parts(layout, box_kind)
          layout_update(self, { size = get_layout_size(box_kind) }, box)
        end

        return TSLayout(layout)
      end,
    },
  },
  pickers = {
    find_files = {
      -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
      find_command = {
        "rg",
        "--files",
        "--hidden",
        "--glob",
        "!**/.git/*",
        "fd",
        "--type",
        "f",
        "--strip-cwd-prefix",
      },
    },
  },
  extensions = {
    projects = {
      prompt_prefix = "󱎸  ",
      layout_strategy = "horizontal",
      layout_config = {
        anchor = "N",
        height = 0.25,
        width = 0.6,
        prompt_position = "bottom",
      },
    },
    -- file_browser = {
    --   theme = "ivy",
    --   -- disables netrw and use telescope-file-browser in its place
    --   hijack_netrw = true,
    -- },
  },
})

-- local telescope = require("telescope")

-- require("telescope").load_extension("projects")

-- telescope.load_extension("telescope-file-browser")
return {
  "nvim-telescope/telescope.nvim",
  lazy = false,
  -- tag = "0.1.8",
  cmd = "Telescope",
  build = "make",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "DrKJeff16/project.nvim",
    "andrew-george/telescope-themes",
    "nyarthan/telescope-code-actions.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
  },

  config = function(_, opts)
    -- load extensions --
    local telescope = require("telescope")

    telescope.setup(opts)

    telescope.load_extension("projects")
    telescope.load_extension("themes")
    telescope.load_extension("file_browser")
    telescope.load_extension("code_actions")
  end,
}
