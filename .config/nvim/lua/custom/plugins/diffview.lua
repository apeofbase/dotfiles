return {
  {
    'sindrets/diffview.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewFileHistory', 'DiffviewToggleFiles', 'DiffviewFocusFiles' },
    keys = {
      { '<leader>gd', '<cmd>DiffviewOpen<CR>',            desc = '[G]it [d]iff view' },
      { '<leader>gh', '<cmd>DiffviewFileHistory %<CR>',   desc = '[G]it file [h]istory' },
      { '<leader>gH', '<cmd>DiffviewFileHistory<CR>',     desc = '[G]it repo [H]istory' },
      { '<leader>gc', '<cmd>DiffviewClose<CR>',           desc = '[G]it diff [c]lose' },
      { '<leader>gr', '<cmd>DiffviewRefresh<CR>',         desc = '[G]it diff [r]efresh' },
    },
    config = function()
      local actions = require 'diffview.actions'

      require('diffview').setup {
        enhanced_diff_hl = true,  -- Better highlighting for added/removed lines
        use_icons = true,         -- Requires nvim-web-devicons
        show_help_hints = true,   -- Show hints for opening the help panel
        watch_index = true,       -- Auto-update when the git index changes

        view = {
          default = {
            layout = 'diff2_horizontal',
            disable_diagnostics = true,
          },
          merge_tool = {
            layout = 'diff3_horizontal',
            disable_diagnostics = true,
            winbar_info = true,
          },
          file_history = {
            layout = 'diff2_horizontal',
            disable_diagnostics = true,
          },
        },

        file_panel = {
          listing_style = 'tree',
          tree_options = {
            flatten_dirs = true,
            folder_statuses = 'only_folded',
          },
          win_config = {
            position = 'left',
            width = 35,
          },
        },

        file_history_panel = {
          win_config = {
            position = 'bottom',
            height = 16,
          },
        },

        keymaps = {
          disable_defaults = false,
          view = {
            { 'n', '<leader>co', actions.conflict_choose 'ours',   { desc = '[C]onflict choose [o]urs' } },
            { 'n', '<leader>ct', actions.conflict_choose 'theirs', { desc = '[C]onflict choose [t]heirs' } },
            { 'n', '<leader>cb', actions.conflict_choose 'base',   { desc = '[C]onflict choose [b]ase' } },
            { 'n', '<leader>ca', actions.conflict_choose 'all',    { desc = '[C]onflict choose [a]ll' } },
          },
        },
      }
    end,
  },
}
