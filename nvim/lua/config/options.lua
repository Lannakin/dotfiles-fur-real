-- /config/options.lua
-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

-- KEYMAP GLOBALS --
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- APPEARANCE --
vim.api.nvim_command "syntax enable"           -- Enable syntax highlighting
vim.g.snacks_animate = false                            -- snacks animations

opt.colorcolumn = "80"
opt.cmdheight = 1
opt.conceallevel = 2                                    -- Hide * markup for bold and italic, but not markers with substitutions
opt.cursorline = true                                   -- highlighting of current line
opt.cursorlineopt = "number"
opt.fillchars = { foldopen = "", foldclose = "", fold = " ", foldsep = " ", diff = "╱", eob = " " }
opt.laststatus = 3                                      -- global statusline
opt.list = true                                         -- Show some invisible characters
vim.o.showtabline = 2                                   -- always show buffer tabline
opt.termguicolors = true                                -- True color support

-- BEHAVIOR --
opt.fileformat = "unix"                                 -- Set fileformat to Unix
vim.api.nvim_command "filetype plugin on"      -- Enable filetype plugins
-- LazyVim.terminal.setup("kitty")                      -- terminal to use (optional)

vim.g.lazyvim_picker = "telescope"                      -- tell LazyVim to use Telescope as picker
vim.g.lazyvim_cmp = "auto"                              -- values: auto, nvim-cmp, blink.cmp
-- vim.g.ai_cmp = true                                  -- use ai for completion if supported
vim.g.root_spec = { "lsp", { ".git", "Makefile" }, "cwd" } -- LazyVim root dir detection
vim.g.root_lsp_ignore = { "copilot" }                   -- Set LSP servers to be ignored when used with `util.root.detectors.lsp`
                                                        -- for detecting the LSP root
vim.g.deprecation_warnings = true
vim.g.trouble_lualine = true                            -- Show symbols location from Trouble in lualine
vim.b.trouble_lualine = true                            -- Show symbols location from Trouble in lualine (buffer)

opt.autowrite = true -- auto write
opt.mouse = "a" -- Enable mouse mode
                                                        -- Sync with system clipboard
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- only set clipboard if not in ssh, to make sure the OSC 52 integration works
opt.completeopt = "menu,menuone,noselect"               -- Configure completion options
opt.confirm = true                                      -- Confirm to save changes before exiting modified buffer
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.hidden = true                                       -- allows keeping modified buffers in memory when not displayed
opt.jumpoptions = "view"                                -- jumplist control
opt.ruler = false                                       -- default ruler
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.showmode = false                                    -- Dont show mode since we have a statusline
-- opt.timeoutlen = vim.g.vscode and 1000 or 300           -- Lower than default (1000) to quickly trigger which-key
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200                                    -- Save swap file and trigger CursorHold
opt.virtualedit = "block"                               -- Allow cursor to move where there is no text in visual block
opt.wildmode = "longest:full,full"                      -- Command-line completion mode

-- COMMANDS --

-- EDITOR --
-- behavior --
opt.smoothscroll = true
opt.spelllang = { "en" }
vim.g.autoformat = false                                -- LazyVim auto format
vim.g.lazyvim_eslint_auto_format = false                -- LazyVim eslint auto format
-- context --
opt.scrolloff = 4                                       -- Lines of context
opt.sidescrolloff = 8                                   -- Columns of context
-- indentation --
vim.g.markdown_recommended_style = 1                    -- Fix markdown indentation settings
opt.expandtab = true                                    -- Use spaces instead of tabs
opt.tabstop = 4                                         -- Number of spaces tabs count for
opt.smartindent = true                                  -- Insert indents automatically
opt.shiftround = true                                   -- Round indent
opt.shiftwidth = 4                                      -- Size of an indent
opt.softtabstop = 4
-- folding --
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false
opt.foldlevelstart = 99
-- format --
opt.formatexpr = "v:lua.LazyVim.format.formatexpr()"
opt.formatoptions = "jcroqlnt"                          -- tcqj
opt.inccommand = "nosplit"                              -- preview incremental substitute
-- line numbers --
opt.number = true                                       -- Print line number
vim.wo.relativenumber = false                           -- relative line numbers
opt.relativenumber = false                              -- Relative line numbers
opt.signcolumn = "yes"                                  -- Always show the signcolumn, otherwise it will shift the text each time

-- LINE WRAP --
opt.linebreak = true                                    -- Wrap lines at specific characters
opt.wrap = true                                         -- line wrap

-- SEARCH --
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
-- opt.hlsearch = true

-- WINDOW LAYOUT --
opt.splitbelow = true                                   -- Put new windows below current
opt.splitkeep = "screen"
opt.splitright = true                                   -- Put new windows right of current
opt.pumblend = 10                                       -- Popup blend
opt.pumheight = 15                                      -- Maximum number of entries in a popup
opt.statuscolumn = [[%!v:lua.LazyVim.statuscolumn()]]
opt.winminwidth = 5                                     -- Minimum window width

-- ADD FILETYPES
vim.filetype.add {
  extension = {
    conf = "conf",
    config = "conf",
    md = "markdown",
    adoc = "markdown",
    mdx = "mdx",
    lua = "lua",
    sh = "sh",
    h = function(_, bufnr)
      -- check whether header file is C or C++
      local lines = vim.api.nvim_buf_get_lines(bufnr, 0, math.min(20, vim.api.nvim_buf_line_count(bufnr)), false)

      for _, line in ipairs(lines) do
        if line:match "^%s*#include%s*<[^>.]+>$" then
          return "cpp"
        end
      end

      return "c"
    end,
  },
}
