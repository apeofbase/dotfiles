return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      auto_attach = true,
      attach_to_untracked = false,
      current_line_blame = false,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol',
        delay = 50,
        ignore_whitespace = false,
      },

      on_attach = function(bufnr)
        local gitsigns = require 'gitsigns'

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        --
        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            gitsigns.nav_hunk 'next'
          end
        end, { desc = 'Jump to next git [c]hange' })

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end, { desc = 'Jump to previous git [c]hange' })

        -- Actions
        -- Toggles
        map('n', '<leader>gb', gitsigns.toggle_current_line_blame, { desc = '[G]itsigns [b]lame line' })
        map('n', '<leader>gD', gitsigns.preview_hunk_inline, { desc = '[G]itsigns show [D]eleted' })

      end,
    },
  },
}
