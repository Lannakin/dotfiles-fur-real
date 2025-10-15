-- if true then return {} end
-- https://github.com/DrKJeff16/project.nvim
require('project').setup({
  -- Options for logging utility.
  ---@type Project.Config.Logging
  log = {
      -- If true, it enables logging in the same directory in which your
      -- history file is stored.
      -- Default: false
      ---@type boolean
      enabled = false,
      -- The maximum logfile size (in megabytes).
      -- Default: 1.1
      ---@type number
      max_size = 1.1,
      -- Path in which the log file will be saved.
      -- Default: vim.fn.stdpath('state')
      ---@type string
      logpath = vim.fn.stdpath('state'),
  },
  -- Table of options used for fzf-lua integration
  ---@type Project.Config.FzfLua
  fzf_lua = {
      -- Determines whether the fzf-lua integration is enabled.
      -- If fzf-lua is not installed, this won't make a difference.
      -- Default: false
      ---@type boolean
      enabled = false,
  },
  -- Determines in what filetypes/buftypes the plugin won't execute.
  -- It's a table with two fields:
  --  - ft: A string array of filetypes to exclude
  --  - bt: A string array of buftypes to exclude
  -- The default value for this one can be found in the project's README.md.
  ---@type { ft: string[], bt: string[] }
  disable_on = {
      ft = {
          '',
          'TelescopePrompt',
          'TelescopeResults',
          'alpha',
          'checkhealth',
          'lazy',
          'minimap', -- from mini.map
          'notify',
          'packer',
          'qf',
      },
      bt = {
          'help',
          'nofile',
          'terminal',
      },
  },
  -- If true your root directory won't be changed automatically,
  -- so you have the option to manually do so
  -- using the :ProjectRoot command.
  -- Default: false
  ---@type boolean
  manual_mode = false,
  -- Methods of detecting the root directory. 'lsp' uses the native Neovim
  -- LSP, while 'pattern' uses vim-rooter like glob pattern matching. Here
  -- order matters: if one is not detected, the other is used as fallback. You
  -- can also delete or rearrange the detection methods.
  -- The detection methods get filtered and rid of duplicates during runtime.
  -- Default: { 'pattern' }
  ---@type ('lsp'|'pattern')[]
  detection_methods = { 'pattern' },
  -- All the patterns used to detect root dir, when **'pattern'** is in
  -- detection_methods.
  -- See :h project-nvim.pattern-matching
  -- Default: { '.git', '.github', '_darcs', '.hg', '.bzr', '.svn', 'Pipfile' }
  ---@type string[]
  patterns = {
      '.git',
      '.github',
      '_darcs',
      '.hg',
      '.bzr',
      '.svn',
      'Pipfile',
  },
  -- Sets whether to use Pattern Matching rules on the LSP.
  -- If false, the Pattern Matching will only apply to the pattern detection method.
  -- Default: true
  ---@type boolean
  allow_patterns_for_lsp = true,
  -- Determines whether a project will be added if its project root is owned by a different user.
  -- If false, it won't add a project if its root is not owned by the
  -- current nvim UID **(UNIX only)**.
  -- Default: true
  ---@type boolean
  allow_different_owners = true,
  -- If enabled, set vim.opt.autochdir to true.
  -- This is disabled by default because the plugin implicitly disables autochdir.
  -- Default: false
  ---@type boolean
  enable_autochdir = false,
  -- The history size. (by @acristoffers)
  -- This will indicate how many entries will be written to the history file.
  -- Set to 0 for no limit.
  -- Default: 100
  ---@type integer
  historysize = 100
  -- Table of options used for the telescope picker.
  ---@type Project.Config.Telescope
  telescope = {
      -- Determines whether the telescope picker should be called
      -- from the setup() function.
      -- If telescope is not installed, this doesn't make a difference.
      -- Note that even if set to false, you can still load the extension manually.
      -- Default: false
      ---@type boolean
      enabled = false,
      -- Determines whether the newest projects come first in the
      -- telescope picker ('newest'), or the oldest ('oldest').
      -- Default: 'newest'
      ---@type 'oldest'|'newest'
      sort = 'newest',
      -- If you have telescope-file-browser.nvim installed, you can enable this
      -- so that the Telescope picker uses it instead of the find_files builtin.
      -- If true, use telescope-file-browser.nvim instead of builtins.
      -- In case it is not available, it'll fall back to find_files.
      -- Default: false
      ---@type boolean
      prefer_file_browser = false,
      -- Set this to true if you don't want the file picker to appear
      -- after you've selected a project.
      -- Default: false
      ---@type boolean
      disable_file_picker = false,
      -- Table of mappings for the Telescope picker.
      -- Only supports Normal and Insert modes.
      -- Default: check the README
      ---@type table<'n'|'i', table<string, Project.Telescope.ActionNames>>
      mappings = {
          n = {
              b = 'browse_project_files',
              d = 'delete_project',
              f = 'find_project_files',
              r = 'recent_project_files',
              s = 'search_in_project_files',
              w = 'change_working_directory',
          },
          i = {
              ['<C-b>'] = 'browse_project_files',
              ['<C-d>'] = 'delete_project',
              ['<C-f>'] = 'find_project_files',
              ['<C-r>'] = 'recent_project_files',
              ['<C-s>'] = 'search_in_project_files',
              ['<C-w>'] = 'change_working_directory',
          },
      },
  },
  -- Make hidden files visible when using any picker.
  -- Default: false
  ---@type boolean
  show_hidden = false,
  -- Table of lsp clients to ignore by name,
  -- e.g. { 'efm', ... }.
  -- If you have nvim-lspconfig installed **see** :h lspconfig-all
  -- for a list of servers.
  -- Default: {}
  ---@type string[]
  ignore_lsp = {},
  -- Don't calculate root dir on specific directories,
  -- e.g. { '~/.cargo/*', ... }.
  -- See the Pattern Matching section in the README.md for more info.
  -- Default: {}
  ---@type string[]
  exclude_dirs = {},
  -- If false, you'll get a _notification_ every time
  -- project.nvim changes directory.
  -- This is useful for debugging, or for players that
  -- enjoy verbose operations.
  -- Default: true
  ---@type boolean
  silent_chdir = true,
  -- Determines the scope for changing the directory.
  -- Valid options are:
  --  - 'global': All your nvim cwd will sync to your current buffer's project
  --  - 'tab': _Per-tab_ cwd sync to the current buffer's project
  --  - 'win': _Per-window_ cwd sync to the current buffer's project
  -- Default: 'global'
  ---@type 'global'|'tab'|'win'
  scope_chdir = 'global',
  -- Hook to run before attaching to a new project.
  -- It recieves target_dir and, optionally,
  -- the method used to change directory.
  -- Default: function(target_dir, method) end
  ---@param target_dir? string
  ---@param method? string
  before_attach = function(target_dir, method) end,
  -- Hook to run after attaching to a new project.
  -- **_This only runs if the directory changes successfully._**
  -- It recieves dir and, optionally,
  -- the method used to change directory.
  -- Default: function(dir, method) end
  ---@param dir? string
  ---@param method? string
  on_attach = function(dir, method) end,
  -- The path where project.nvim will store the project history directory,
  -- containing the project history in it.
  -- For more info, run :lua vim.print(require('project').get_history_paths())
  -- Default: vim.fn.stdpath('data')
  ---@type string
  datapath = vim.fn.stdpath('data'),
})