return {
  {
    -- Lightweight yet powerful formatter plugin
    -- https://github.com/stevearc/conform.nvim
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
    -- Mappings to easily delete, change and add surroundings in pairs
    -- https://github.com/tpope/vim-surround
    "tpope/vim-surround",
    lazy = false
  },

  {
    -- Autopair plugin that supports multiple characters
    -- https://github.com/windwp/nvim-autopairs
    'windwp/nvim-autopairs',
    event = "InsertEnter"
  },

  {
    -- Delete buffers (close files) without closing your windows
    -- https://github.com/moll/vim-bbye
    "moll/vim-bbye",
    lazy = false
  },

  {
    -- Better Quickfix
    -- https://github.com/kevinhwang91/nvim-bqf
    "kevinhwang91/nvim-bqf",
    lazy = false
  },
}
