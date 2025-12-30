-- /config/options.lua
-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
local glob = vim.g
local buf = vim.b

-- stylua: ignore start
-- --| KEYMAP GLOBALS |-----------------------------------------------------------------------------------------------
glob.mapleader = " "
glob.maplocalleader = "\\"

-- --| APPEARANCE |---------------------------------------------------------------------------------------------------
vim.api.nvim_command "syntax enable"           -- Enable syntax highlighting
glob.snacks_animate = false                             -- snacks animations

opt.colorcolumn = "80"
opt.cmdheight = 1
opt.conceallevel = 2                                    -- Hide * markup for bold and italic, but not markers with substitutions
opt.cursorline = true                                   -- highlighting of current line
opt.cursorlineopt = "number"
opt.fillchars = { foldopen = "", foldclose = "", fold = " ", foldsep = " ", diff = "╱", eob = " " }
opt.laststatus = 3                                      -- global statusline
opt.linebreak = true                                    -- Wrap lines at specific characters
opt.wrap = true                                         -- line wrap
opt.list = true                                         -- Show some invisible characters
opt.listchars = {
  eol = '⏎',
  nbsp = '⎵',
  tab = '»·', -- » - OE '␉·'
  trail = '-',
--  space = '·'
}
opt.showtabline = 2                                     -- always show buffer tabline
opt.termguicolors = true                                -- True color support


-- --| BEHAVIOR |-----------------------------------------------------------------------------------------------------
opt.errorbells = true                                   -- error bells
opt.fileformat = "unix"                                 -- Set fileformat to Unix
vim.api.nvim_command "filetype plugin on"      -- Enable filetype plugins
-- LazyVim.terminal.setup("kitty")                      -- terminal to use (optional)

glob.lazyvim_picker = "telescope"                       -- tell LazyVim to use Telescope as picker
glob.lazyvim_cmp = "auto"                               -- values: auto, nvim-cmp, blink.cmp
-- glob.ai_cmp = true                                   -- use ai for completion if supported
glob.root_spec = { "lsp", { ".git", "Makefile" }, "cwd" } -- LazyVim root dir detection
glob.root_lsp_ignore = { "copilot" }                    -- Set LSP servers to be ignored with `util.root.detectors.lsp`
glob.deprecation_warnings = true
glob.trouble_lualine = true                             -- Show symbols location from Trouble in lualine
buf.trouble_lualine = true                              -- Show symbols location from Trouble in lualine (buffer)

opt.autowrite = true -- auto write
opt.mouse = "a" -- Enable mouse mode
opt.clipboard = "unnamedplus"                           -- sync w/ system clipboard
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- only sync system clipboard if not in ssh
opt.completeopt = "menu,menuone,noselect"               -- Configure completion options
opt.confirm = true                                      -- Confirm to save changes before exiting modified buffer
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.hidden = true                                       -- allows keeping modified buffers in memory when not displayed
opt.jumpoptions = "view"                                -- jumplist control
opt.maxmempattern = 20000
opt.redrawtime = 10000
opt.ruler = false                                       -- default ruler
                                                        -- src: https://neovim.io/doc/user/options.html#'sessionoptions'
opt.sessionoptions = { "buffers", "curdir", "globals", "folds", "skiprtp", "tabpages", "winsize", "winpos" }
opt.showmode = false                                    -- Dont show mode since we have a statusline
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200                                    -- Save swap file and trigger CursorHold
opt.virtualedit = "block"                               -- Allow cursor to move where there is no text in visual block
opt.wildmode = "longest:full,full"                      -- Command-line completion mode

-- --| EDITOR |-------------------------------------------------------------------------------------------------------
-- behavior --
opt.diffopt:append("linematch:60")
opt.selection = "inclusive"                             -- Selection behavior: exclusive, inclusive, old
                                                        -- src: https://neovim.io/doc/user/options.html#'selection'
opt.smoothscroll = true
opt.spelllang = { "en" }
glob.autoformat = false                                 -- LazyVim auto format
glob.lazyvim_eslint_auto_format = false                 -- LazyVim eslint auto format
opt.showmatch = true                                    -- Highlight matching brackets
-- context --
opt.scrolloff = 10                                      -- Lines of context
opt.sidescrolloff = 10                                  -- Columns of context
-- indentation --
glob.markdown_recommended_style = 1                     -- Fix markdown indentation settings
opt.expandtab = true                                    -- Use spaces instead of tabs
opt.tabstop = 4                                         -- Number of spaces tabs count for
opt.smartindent = true                                  -- Insert indents automatically
opt.shiftround = true                                   -- Round indent
opt.shiftwidth = 4                                      -- Size of an indent
opt.softtabstop = 4
opt.textwidth = 80
-- folding --
opt.fillchars = {
  diff = "/",
  eob = " ",
  fold = " ",
  foldclose = "",
  foldopen = "",
  foldsep = " ",
}
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false
opt.foldlevelstart = 99
-- format --
opt.formatexpr = "v:lua.LazyVim.format.formatexpr()"
opt.formatoptions = "jcroqlnt"                          -- tcqj
opt.inccommand = "nosplit"                              -- preview incremental substitute
-- statuscolumn --
opt.number = true                                       -- Print line number
vim.wo.relativenumber = false                           -- relative line numbers
opt.relativenumber = false                              -- Relative line numbers
opt.signcolumn = "yes"                                  -- Always show the signcolumn

-- --| SEARCH |-------------------------------------------------------------------------------------------------------
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
-- opt.hlsearch = true

-- --| WINDOW LAYOUT |------------------------------------------------------------------------------------------------
opt.splitbelow = true                                   -- Put new windows below current
opt.splitkeep = "screen"
opt.splitright = true                                   -- Put new windows right of current
opt.pumblend = 10                                       -- Popup blend
opt.pumheight = 15                                      -- Maximum number of entries in a popup
opt.statuscolumn = [[%!v:lua.LazyVim.statuscolumn()]]
-- opt.statuscolumn = [[%!v:lua.snacks.statuscolumn()]]
opt.winminwidth = 5                                     -- Minimum window width
-- stylua: ignore end

-- --| ADD FILETYPES |------------------------------------------------------------------------------------------------
vim.filetype.add {
  extension = {
    conf = "conf",
    config = "conf",
    env = "dotenv",
    md = "markdown",
    adoc = "markdown",
    mdx = "mdx",
    lua = "lua",
    sh = "sh",
    h = function(_, bufnr)
      local buf_get_lines = vim.api.nvim_buf_get_lines
      local buf_line_count = vim.api.nvim_buf_line_count
      -- check whether header file is C or C++
      local lines = buf_get_lines(bufnr, 0, math.min(20, buf_line_count(bufnr)), false)

      for _, line in ipairs(lines) do
        if line:match "^%s*#include%s*<[^>.]+>$" then
          return "cpp"
        end
      end

      return "c"
    end,
  },

  filename = {
    [".env"] = "dotenv",
    ["env"] = "dotenv",
  },

  pattern = {
    ["[jt]sconfig.*.json"] = "jsonc",
    ["%.env%.[%w_.-]+"] = "dotenv",
  },
}
