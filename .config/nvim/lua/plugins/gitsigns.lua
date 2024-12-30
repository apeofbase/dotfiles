return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      auto_attach = true,
      attach_to_untracked = false,
      current_line_blame = false,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 50,
        ignore_whitespace = false,
      },

      on_attach = function (bufnr)
        vim.keymap.set('n', '<leader>hs', require('gitsigns').stage_hunk, { desc = "Stage hunk" })
        vim.keymap.set('n', '<leader>hr', require('gitsigns').reset_hunk, { desc = "Reset hunk" })
        vim.keymap.set('v', '<leader>hs', function() require('gitsigns').stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = "Stage hunk" })
        vim.keymap.set('v', '<leader>hr', function() require('gitsigns').reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = "Reset hunk" })
        vim.keymap.set('n', '<leader>hb', require('gitsigns').blame, { desc = "Blame file" })
        vim.keymap.set('n', '<leader>ht', require('gitsigns').toggle_current_line_blame, { desc = "Toggle current blame line" })
        vim.keymap.set('n', '<leader>hd', require('gitsigns').toggle_deleted, { desc = "Toggle deleted" })
      end
    }
  }
}
