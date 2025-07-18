return {
  {
    'kdheepak/lazygit.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = 'LazyGit',
    keys = {
      { '<leader>tl', '<cmd>LazyGit<CR>', desc = '[T]oggle [L]azyGit' },
    },
  },
}
