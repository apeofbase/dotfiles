return {
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      -- set termguicolors
      -- In your init.vim or init.lua
      local bufferline = require 'bufferline'
      bufferline.setup {
        options = {
          always_show_bufferline = false,
          style_preset = {
            bufferline.style_preset.no_italic,
            bufferline.style_preset.no_bold,
          },
        },
      }
    end,
  },
}
