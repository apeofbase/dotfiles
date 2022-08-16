local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"

telescope.setup {
  defaults = {

    prompt_prefix = " ",
    selection_caret = " ",
    -- path_display = { "smart" }, -- "smart is slooooooow"
    file_ignore_patterns = { ".git/", "node_modules/" },

    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<ESC>"] = actions.close,
        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["<CR>"] = actions.select_default,
        ["C-U"] = actions.preview_scrolling_up,
        ["C-D"] = actions.preview_scrolling_down,
        ["C-u"] = actions.results_scrolling_up,
        ["C-d"] = actions.results_scrolling_down,
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "ignore_case",       -- "ignore_case" "respect_case" default: "smart_case"
    }
  }
}

require('telescope').load_extension('fzf')
