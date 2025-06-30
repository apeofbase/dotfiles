return {
  {
    -- Delete buffers (close files) without closing your windows
    -- https://github.com/moll/vim-bbye
    'moll/vim-bbye',
    lazy = false,
    config = function()
      -- Handle closing buffers if they are not saved
      vim.keymap.set('n', '<leader>x', function()
        if vim.bo.modified then
          -- Prompt to save changes for named buffers
          local choice = vim.fn.confirm('Save changes before closing?', '&Yes\n&No\n&Cancel', 1)
          if choice == 1 then
            -- Prompt for a filename if the buffer has no name
            local filename = vim.fn.input('Enter filename: ', '', 'file')
            filename = filename ~= '' and filename or 'untitled'
            if filename ~= '' then
              vim.cmd('write ' .. filename) -- Save the file with the provided name
              vim.cmd 'Bdelete!' -- Close the buffer
            end
          elseif choice == 2 then
            vim.cmd 'Bwipeout!' -- Close without saving
          end
        else
          vim.cmd 'Bwipeout!' -- Close the buffer if there are no changes
        end
      end, { desc = 'E[x]it buffer' })
    end,
  },
}
