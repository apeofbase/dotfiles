-- Mappings
--
--  These mappsings should only cover base Neovim keymaps.
--  For plugin related keymaps, place inside plugin config file.

require "nvchad.mappings"

local opts = { noremap = true, silent = false }
local map = vim.keymap.set
local fn = vim.fn
local nomap = vim.keymap.del

-- Fix mappings
nomap("n", "<leader>h")

-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Naviagate buffers
map("n", "<S-h>", ":bprevious<CR>", opts)
map("n", "<S-l>", ":bnext<CR>", opts)

-- Move text up and down
map("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
map("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Folds
map("n", "<C-f>", ":fold<CR>", opts)

-- Highlight search toggle
map("n", "<leader>ho", ":nohlsearch<CR>", opts)

-- Insert --
-- Press jj fast to enter
map("i", "jj", "<Esc>", opts)

-- Visual --
-- Stay in indent mode
map("v", "<Tab>", ">`<V`>", opts)
map("v", "<S-Tab>", "<`<V`>", opts)

-- Prevents deleted text from overwriting yank buffer
map("v", "p", '"_dP', opts)

-- Spell check toggle
map("n", "<leader>sc", ":set spell!<CR>", {desc = "Toggle Spell Check"})

-- Visual Block --
-- Move text up and down
map("x", "J", ":move '>+1<CR>gv-gv", opts)
map("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Other
map("n", "<leader>dc", ':!ddev drush cr<CR>', { desc = "DDEV Drush Clear Cache" })

-- Fix * search word behavior stay on first word
map("n", "*", function()
  fn.setreg("/", [[\V\<]] .. fn.escape(fn.expand("<cword>"), [[/\]]) .. [[\>]])
  fn.histadd("/", fn.getreg("/"))
  vim.o.hlsearch = true
end)
