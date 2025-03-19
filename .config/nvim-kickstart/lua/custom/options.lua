-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true

-- Start Neovim without welcome message
vim.opt.shortmess:append 'I'

-- Relative line numbers
-- vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
-- vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'both'

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Creates a backup file
vim.opt.backup = false

-- More space in the Neovim command line for displaying messages
vim.opt.cmdheight = 1

-- vim.opt.colorcolumn = "120"
-- vim.opt.colorcolumn = "80"

-- A comma-separated list of options for Insert mode completion
vim.opt.completeopt = { 'menuone', 'noselect', 'preview' }

-- Hides some characters eg - `` is visible in markdown files
vim.opt.conceallevel = 0

-- Convert tabs to spaces
vim.opt.expandtab = true

vim.opt.fileencoding = 'utf-8'

-- Characters to fill the statuslines, vertical separators and special lines in the window.
vim.opt.fillchars.eob = ' '

vim.opt.guifont = 'monospace:h17'

-- Highlight all matches on previous search pattern
vim.opt.hlsearch = true

-- Characters to consider as part of a word
vim.opt.iskeyword:append '-'

-- When the last window will have a status line
vim.opt.laststatus = 3

-- Minimal number of columns to use for the line number
vim.opt.numberwidth = 2

-- Maximum number of items to show in the popup menu
vim.opt.pumheight = 7

-- Show the line and column number of the cursor position, separated by a comma
vim.opt.ruler = false

-- Number of spaces to use for each step of (auto)indent
vim.opt.shiftwidth = 2

-- This option helps to avoid all the |hit-enter| prompts caused by file messages
vim.opt.shortmess:append 'c'

-- Show (partial) command in the last line of the screen. Set to off if terminal is slow.
vim.opt.showcmd = true

-- Disable tabline
vim.opt.showtabline = 0

-- Min number of columns to keep to the left/right of cursor
vim.opt.sidescrolloff = 8

-- Do smart autoindenting when starting a new line
vim.opt.smartindent = true

vim.opt.spelllang = 'en_us'

vim.opt.swapfile = false

-- Number of spaces in a <Tab>
vim.opt.tabstop = 2

vim.opt.termguicolors = true

-- Line wrapping
vim.opt.wrap = false

-- Backup before overwriting a file
vim.opt.writebackup = false
