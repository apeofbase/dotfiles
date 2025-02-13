return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- User plugins
  --
  {
    "tpope/vim-surround",
    lazy = false
  },

  {
    'windwp/nvim-autopairs',
    event = "InsertEnter"
  },

  {
    "moll/vim-bbye",
    lazy = false
  },

  {
    "kevinhwang91/nvim-bqf",
    lazy = false
  },
}
