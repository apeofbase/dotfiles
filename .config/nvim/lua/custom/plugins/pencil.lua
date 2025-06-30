return {
  {
    'preservim/vim-pencil',
    ft = {
      'md',
      'markdown',
    },
    config = function()
      vim.cmd 'Pencil'
      vim.g['pencil#autoformat'] = 1
      vim.g['pencil#textwidth'] = 80
      vim.g['pencil#wrapModeDefault'] = 'soft'
      vim.fn['pencil#init'] { wrap = 'soft' }
      vim.g['pencil#conceallevel'] = 2
      vim.opt.conceallevel = 2
    end,
  },
}
