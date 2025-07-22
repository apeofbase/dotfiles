-- [[ Basic Keymaps ]]
--
-- Set <space> as the leader key
-- NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Press jj fast to enter
vim.keymap.set('i', 'jj', '<Esc>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Resize with arrows
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', { noremap = true, silent = false })

-- Naviagate buffers
vim.keymap.set('n', '<S-h>', ':bprevious<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<S-l>', ':bnext<CR>', { noremap = true, silent = false })

-- TODO: Figure out what this was supposed to do
-- Move text up and down
-- vim.keymap.set('n', '<A-j>', '<Esc>:m .+1<CR>==gi', { noremap = true, silent = false })
-- vim.keymap.set('n', '<A-k>', '<Esc>:m .-2<CR>==gi', { noremap = true, silent = false })

-- Visual --
-- Stay in indent mode
vim.keymap.set('v', '<Tab>', '>`<V`>', { noremap = true, silent = false })
vim.keymap.set('v', '<S-Tab>', '<`<V`>', { noremap = true, silent = false })
-- vim.keymap.set('v', '>', '>`<V`>', { noremap = true, silent = false })
-- vim.keymap.set('v', '<', '<`<V`>', { noremap = true, silent = false })

-- Prevents deleted text from overwriting yank buffer
-- vim.keymap.set('n', 'dd', '"_dd')
-- vim.keymap.set('v', 'd', '"_d')
-- vim.keymap.set('n', 'D', '"_D')
vim.keymap.set('n', 'x', '"_x')

-- Spell check toggle
vim.keymap.set('n', '<leader>sc', ':set spell!<CR>', { desc = 'Toggle Spell Check' })

-- Yank all text
vim.keymap.set('n', 'yY', function ()
  local pos = vim.api.nvim_win_get_cursor(0)
  vim.cmd('normal! ggVGy')
  vim.api.nvim_win_set_cursor(0, pos)
end, { noremap = true, desc = 'All text in buffer' })

-- Visual Block --
-- Move text up and down
vim.keymap.set('x', 'J', ":move '>+1<CR>gv-gv", { noremap = true, silent = false })
vim.keymap.set('x', 'K', ":move '<-2<CR>gv-gv", { noremap = true, silent = false })

-- Fix * search word behavior stay on first word
vim.keymap.set('n', '*', function()
  vim.fn.setreg('/', [[\V\<]] .. vim.fn.escape(vim.fn.expand '<cword>', [[/\]]) .. [[\>]])
  vim.fn.histadd('/', vim.fn.getreg '/')
  vim.o.hlsearch = true
end)

-- Other
vim.keymap.set('n', '<leader>cc', ':silent !ddev drush cr<CR>', { desc = 'DDEV Drush [C]lear [C]ache' })
vim.keymap.set('n', '<leader>tc', ':close<CR>', { desc = '[T]oggle [C]lose' })
