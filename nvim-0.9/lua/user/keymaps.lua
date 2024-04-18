local opts = { noremap = true, silent = false }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap
local fn = vim.fn

--Remap Space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Start commands with Space
-- keymap("n", "<SPACE>", ":", opts)

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Fix * search word behavior stay on first word
vim.keymap.set("n", "*", function()
    fn.setreg("/", [[\V\<]] .. fn.escape(fn.expand("<cword>"), [[/\]]) .. [[\>]])
    fn.histadd("/", fn.getreg("/"))
    vim.o.hlsearch = true
end)

-- Change all occurance of words under cursor
keymap("n", "<Leader>c", [[:%s/<C-r><C-w>//g<Left><Left>]], opts)

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

-- Insert --
-- Press jj fast to enter
keymap("i", "jj", "<Esc>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<Tab>", ">`<V`>", opts)
keymap("v", "<S-Tab>", "<`<V`>", opts)

-- Prevents deleted text from overwriting yank buffer
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- NvimTree
keymap("n", "<C-b>", ":NvimTreeToggle<CR>", opts)

-- FzfLua
keymap("n", ";", ":FzfLua files<CR>", opts)
keymap("n", "<a-;>", ":FzfLua live_grep_glob<CR>", opts)
keymap("n", "<leader>bf", ":FzfLua buffers<CR>", opts)
keymap("n", "<leader>gs", ":FzfLua git_status<CR>", opts)

-- Gitsigns
keymap("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", opts)

-- illuminate
keymap("n", "<a-f>", '<cmd>lua require("illuminate").goto_next_reference{wrap=true}<cr>', opts)
keymap("n", "<Sa-f>", '<cmd>lua require("illuminate").goto_prev_reference{reverse=true,wrap=true}<cr>', opts)
