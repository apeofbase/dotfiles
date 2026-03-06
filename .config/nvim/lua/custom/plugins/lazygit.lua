return {
  {
    'kdheepak/lazygit.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = 'LazyGit',
    keys = {
      { '<leader>gl', '<cmd>LazyGit<CR>', desc = '[G]it [L]azyGit' },
    },
  },
}
