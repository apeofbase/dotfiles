return {
  {
    'kdheepak/lazygit.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = 'LazyGit',
    -- config = function()
    --   vim.keymap.set("n", "<leader>lg", ":LazyGit<CR>", { desc = "[L]azy[G]it" })
    -- end,
    keys = {
      { '<leader>tl', '<cmd>LazyGit<CR>', desc = '[T]oggle [L]azyGit' },
    },
  },
}
