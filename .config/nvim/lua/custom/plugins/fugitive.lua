return {
  {
    'tpope/vim-fugitive',
    cmd = { 'Git' },
    keys = {
      {
        '<leader>gB',
        function()
          for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
            if vim.bo[vim.api.nvim_win_get_buf(win)].filetype == 'fugitiveblame' then
              vim.api.nvim_win_close(win, false)
              return
            end
          end
          vim.cmd 'Git blame'
        end,
        desc = '[G]it [B]lame toggle',
      },
    },
  },
}
