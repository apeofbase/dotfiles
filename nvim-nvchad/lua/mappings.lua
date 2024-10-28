require "nvchad.mappings"

local opts = { noremap = true, silent = false }
local map = vim.keymap.set
local fn = vim.fn
local nomap = vim.keymap.del

--
-- Core
--

-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Naviagate buffers
map("n", "<S-h>", ":bprevious<CR>", opts)
map("n", "<S-l>", ":bnext<CR>", opts)
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opts)

-- Move text up and down
map("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
map("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Folds
map("n", "<C-f>", ":fold<CR>", opts)

-- Insert --
-- Press jj fast to enter
map("i", "jj", "<Esc>", opts)

-- Visual --
-- Stay in indent mode
map("v", "<Tab>", ">`<V`>", opts)
map("v", "<S-Tab>", "<`<V`>", opts)

-- Prevents deleted text from overwriting yank buffer
map("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
map("x", "J", ":move '>+1<CR>gv-gv", opts)
map("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Fix * search word behavior stay on first word
map("n", "*", function()
  fn.setreg("/", [[\V\<]] .. fn.escape(fn.expand("<cword>"), [[/\]]) .. [[\>]])
  fn.histadd("/", fn.getreg("/"))
  vim.o.hlsearch = true
end)

--
-- Plugins
--

-- Telescope
nomap("n", "<leader>fo")
map('n', "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", { desc = "Find Live Grep" })
map("n", "<leader>fq", require('telescope.builtin').quickfix, { desc = "Find quickfix" } )
map("n", "<leader>fs", require('telescope.builtin').git_status, { desc = "Find Git status files" } )
map("n", "<leader>fw", require('telescope.builtin').grep_string, { desc = "Find word under cursor" } )
map("n", "<leader>fk", require('telescope.builtin').keymaps, { desc = "Find keymaps" } )
map("n", "<leader>fr", require('telescope.builtin').registers, { desc = "Find registers" } )
map("n", "<leader>fo", ":ObsidianSearch<CR>", { desc = "Obsidian Search" })

-- NvimTree
map("n", "<C-b>", ":NvimTreeToggle<CR>", { desc = "NvimTree Toggle" } )
