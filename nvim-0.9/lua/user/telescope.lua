local telescope = require("telescope")
local actions = require("telescope.actions")
local actions_layout = require("telescope.actions.layout")

telescope.setup {
  defaults = {
    vimgrep_arguments = vimgrep_arguments,
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
        ["<ESC>"] = actions.close, -- Disables accessing normal mode
        ["<C-t>"] = actions_layout.toggle_preview,
      },
    },
  },
  pickers = {
    find_files = {
      find_command = { "rg", "--files", "--hidden", "--glob", "!**/node_modules/*", "--glob", "!**/.git/*" },
    },
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {}
    }
  }
}

-- Load extensions
telescope.load_extension("live_grep_args")
telescope.load_extension("ui-select")

-- Keymaps
local builtin = require('telescope.builtin')
local opts = { noremap = true, silent = false }

vim.keymap.set('n', ';', builtin.find_files, opts)
vim.keymap.set('n', '<a-;>', builtin.live_grep, opts)
vim.keymap.set('n', '<leader>ff', builtin.find_files, opts)
vim.keymap.set('n', '<leader>fi', ":Telescope find_files no_ignore=true<CR>", opts)                                 -- Find files inc ignored
vim.keymap.set('n', '<leader>fg', ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", opts) -- Allow passing arguments eg: "string" -t ext
vim.keymap.set('n', '<leader>fb', builtin.buffers, opts)
vim.keymap.set('n', '<leader>fh', builtin.help_tags, opts)
vim.keymap.set('n', '<leader>fq', builtin.quickfix, opts)
vim.keymap.set('n', '<leader>fs', builtin.git_status, opts)
vim.keymap.set("n", "<leader>fw", builtin.grep_string, opts) -- Find word under cursor
vim.keymap.set("n", "<leader>fk", builtin.keymaps, opts)     -- Find keymaps
vim.keymap.set("n", "<leader>fr", builtin.registers, opts)   -- Find keymaps
