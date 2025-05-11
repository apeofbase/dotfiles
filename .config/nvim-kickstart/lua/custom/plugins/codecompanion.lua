return {
  {
    'olimorris/codecompanion.nvim',
    opts = {
      strategies = {
        -- Change the default chat adapter
        chat = {
          adapter = 'copilot',
        },
      },
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      local codecompanion = require 'codecompanion'

      codecompanion.setup {
        vim.keymap.set({ 'n', 'v' }, '<leader>ac', ':CodeCompanionChat Toggle<CR>', { noremap = true, silent = true, desc = '[A]I Code [C]hat' }),
        vim.keymap.set({ 'n', 'v' }, '<leader>aa', ':CodeCompanionActions<CR>', { noremap = true, silent = true, desc = '[A]I Code [A]ctions' }),
        vim.keymap.set({ 'n', 'v' }, '<leader>ae', ':CodeCompanion /explain<CR>', { noremap = true, silent = true, desc = '[A]I Code [E]xplain' }),
        vim.keymap.set({ 'n', 'v' }, '<leader>af', ':CodeCompanion /fix<CR>', { noremap = true, silent = true, desc = '[A]I Code [F]ix' }),

        -- Expand 'cc' into 'CodeCompanion' in the command line
        vim.cmd [[cab cc CodeCompanion]],
      }
    end,
  },
}
