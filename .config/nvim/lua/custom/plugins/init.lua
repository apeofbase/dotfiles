-- Simple plugin includes
return {

  -- Detect tabstop and shiftwidth automatically
  'NMAC427/guess-indent.nvim',

  -- Detect tabstop and shiftwidth automatically
  -- https://github.com/tpope/vim-sleuth
  'tpope/vim-sleuth',

  -- Simple Git commands
  'tpope/vim-fugitive',

  -- Highlight todo, notes, etc in comments
  -- https://github.com/folke/todo-comments.nvim
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },

  {
    -- Autopair plugin that supports multiple characters
    -- https://github.com/windwp/nvim-autopairs
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
  },

  {
    -- Better Quickfix
    -- https://github.com/kevinhwang91/nvim-bqf
    'kevinhwang91/nvim-bqf',
    lazy = false,
  },

  -- Relative / absolute auto line number toggle
  { 'sitiom/nvim-numbertoggle' },

}
