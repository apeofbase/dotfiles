require "nvchad.mappings"

-- add yours here

local opts = { noremap = true, silent = false }
local keymap = vim.keymap.set
local fn = vim.fn

-- Fix * search word behavior stay on first word
vim.keymap.set("n", "*", function()
  fn.setreg("/", [[\V\<]] .. fn.escape(fn.expand("<cword>"), [[/\]]) .. [[\>]])
  fn.histadd("/", fn.getreg("/"))
  vim.o.hlsearch = true
end)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Naviagate buffers
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<leader>bc", ":BufferLinePickClose<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Folds
keymap("n", "<C-f>", ":fold<CR>", opts)

-- Insert --
-- Press jj fast to enter
keymap("i", "jj", "<Esc>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<Tab>", ">`<V`>", opts)
keymap("v", "<S-Tab>", "<`<V`>", opts)

-- Prevents deleted text from overwriting yank buffer
keymap("v", "p", '"_dP', opts)

-- Close current buffer and focus previous
keymap("n", "<leader>q", ":b#|bd#<CR>", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
