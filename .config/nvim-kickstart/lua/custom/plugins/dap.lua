return {
  {

    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'theHamsta/nvim-dap-virtual-text',
    },

    config = function()
      local dap = require 'dap'

      vim.api.nvim_set_hl(0, 'DapBreakpoint', { link = 'Title' })
      vim.api.nvim_set_hl(0, 'DapLogPoint', { link = 'DiagnosticInfo' })
      vim.api.nvim_set_hl(0, 'DapStopped', { link = 'DiagnosticError' })

      vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
      vim.fn.sign_define('DapBreakpointCondition', { text = '󰋗', texthl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
      vim.fn.sign_define('DapBreakpointRejected', { text = '', texthl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
      vim.fn.sign_define('DapLogPoint', { text = '', texthl = 'DapLogPoint', numhl = 'DapLogPoint' })
      vim.fn.sign_define('DapStopped', { text = '', texthl = 'DapStopped', numhl = 'DapStopped' })

      vim.keymap.set('n', '<leader>dc', function()
        require('dap').continue()
      end, { noremap = true, desc = '[D]ap [C]ontinue' })
      vim.keymap.set('n', '<leader>b', function()
        require('dap').toggle_breakpoint()
      end, { noremap = true, desc = 'Dap Toggle [B]reakpoint' })
      vim.keymap.set('n', '<Leader>dr', function()
        require('dap').repl.open()
      end, { desc = '[D]ap [R]epl' })
      vim.keymap.set('n', '<Leader>df', ':Telescope dap frames<CR>', { desc = '[D]ap [F]rames' })
      vim.keymap.set('n', '<Leader>ds', function()
        local widgets = require 'dap.ui.widgets'
        widgets.centered_float(widgets.scopes)
      end, { desc = '[D]ap [S]copes' })
      vim.keymap.set('n', '<Leader>dl', ':Telescope dap list_breakpoints<CR>', { desc = '[D]ap [L]ist Breakpoints' })
      vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
        require('dap.ui.widgets').hover()
      end, { desc = '[D]ap [H]over' })
      vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
        require('dap.ui.widgets').preview()
      end, { desc = '[D]ap [P]review' })
      vim.keymap.set({ 'n', 'v' }, '<Leader>dx', ':DapTerminate<CR>', { desc = '[D]ap E[x]terminate session' })
      vim.keymap.set({ 'n', 'v' }, '<Leader>db', ':DapClearBreakpoints<CR>', { desc = '[D]ap Clear [B]reakpoints' })

      dap.adapters.php = {
        type = 'executable',
        command = 'node',
        args = { os.getenv 'HOME' .. '/Repos/vscode-php-debug/out/phpDebug.js' },
      }

      dap.configurations.php = {
        {
          type = 'php',
          request = 'launch',
          name = 'Listen for Xdebug',
          port = 9003,
          hostname = '0.0.0.0', -- or your host IP if needed
          pathMappings = {
            ['/var/www/html'] = '${workspaceFolder}', -- Adjust based on your DDEV project structure
          },
        },
      }
    end,
  },
}
