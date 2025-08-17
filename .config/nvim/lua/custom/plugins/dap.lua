return {
  {

    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      -- Required dependency for nvim-dap-ui
      'nvim-neotest/nvim-nio',
      'theHamsta/nvim-dap-virtual-text',
    },

    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'

      -- Colors
      vim.api.nvim_set_hl(0, 'DapBreakpoint', { link = 'Title' })
      vim.api.nvim_set_hl(0, 'DapLogPoint', { link = 'DiagnosticInfo' })
      vim.api.nvim_set_hl(0, 'DapStopped', { link = 'DiagnosticError' })

      -- Icons
      vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
      vim.fn.sign_define('DapBreakpointCondition', { text = '󰋗', texthl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
      vim.fn.sign_define('DapBreakpointRejected', { text = '', texthl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
      vim.fn.sign_define('DapLogPoint', { text = '', texthl = 'DapLogPoint', numhl = 'DapLogPoint' })
      vim.fn.sign_define('DapStopped', { text = '', texthl = 'DapStopped', numhl = 'DapStopped' })

      -- Keymaps

      --- Debug: Start/Continue
      vim.keymap.set('n', '<leader>dc', function()
        require('dap').continue()
      end, { noremap = true, desc = '[D]ebug [C]ontinue' })

      vim.keymap.set('n', '<F5>', function()
        require('dap').continue()
      end, { desc = 'Debug: Start/Continue' })

      --- Debug: Step Into
      vim.keymap.set('n', '<F1>', function()
        require('dap').step_into()
      end, { desc = 'Debug: Step Into' })

      --- Debug: Step Over
      vim.keymap.set('n', '<F2>', function()
        require('dap').step_over()
      end, { desc = 'Debug: Step Over' })

      --- Debug: Step Out
      vim.keymap.set('n', '<F3>', function()
        require('dap').step_out()
      end, { desc = 'Debug: Step Out' })

      --- Debug: Toggle Breakpoint
      vim.keymap.set('n', '<leader>b', function()
        require('dap').toggle_breakpoint()
      end, { noremap = true, desc = 'Debug Toggle [B]reakpoint' })

      --- Debug: Clear Breakpoints
      vim.keymap.set({ 'n', 'v' }, '<Leader>dB', ':DapClearBreakpoints<CR>', { desc = '[D]ebug Clear [B]reakpoints' })

      --- Debug: Toggle UI
      vim.keymap.set({ 'n', 'v' }, '<Leader>du', function()
        require('dapui').toggle()
      end, { desc = '[D]ebug [U]I Toggle' })

      --- Debug: Reset UI
      vim.keymap.set('n', '<leader>dr', function()
        require('dapui').open { reset = true }
      end, { desc = 'Reset DAP UI splits' })

      -- vim.keymap.set('n', '<Leader>df', ':Telescope dap frames<CR>', { desc = '[D]ebug [F]rames' })

      --- Debug: Scopes widget
      vim.keymap.set('n', '<Leader>ds', function()
        local widgets = require 'dap.ui.widgets'
        widgets.centered_float(widgets.scopes)
      end, { desc = '[D]ebug [S]copes' })

      --- Debug: Hover widget
      vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
        require('dap.ui.widgets').hover()
      end, { desc = '[D]ebug [H]over' })

      --- Debug: Preview widget
      vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
        require('dap.ui.widgets').preview()
      end, { desc = '[D]ebug [P]review' })

      --- Debug: Terminate
      vim.keymap.set({ 'n', 'v' }, '<Leader>dx', ':DapTerminate<CR>', { desc = '[D]ebug E[x]terminate session' })

      -- DAP Adapters
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

      -- Dap UI setup
      -- For more information, see |:help nvim-dap-ui|
      dapui.setup {
        icons = { expanded = '', collapsed = '', current_frame = '' },
        controls = {
          icons = {
            pause = '',
            play = '',
            step_into = '',
            step_over = '',
            step_out = '',
            step_back = '',
            run_last = '',
            terminate = '',
            disconnect = '⏏',
          },
        },
        layouts = {
          {
            elements = {
              { id = 'watches', size = 0.25 },
              { id = 'breakpoints', size = 0.25 },
              { id = 'scopes', size = 0.5 },
              -- { id = 'stacks', size = 0.25 },
            },
            size = 40, -- width of left panel
            position = 'left',
          },
          {
            elements = {
              { id = 'repl', size = 0.5 },
              { id = 'console', size = 0.5 },
            },
            size = 10, -- height of bottom panel
            position = 'bottom',
          },
        },
      }

      dap.listeners.after.event_initialized['dapui_config'] = dapui.open
      dap.listeners.before.event_terminated['dapui_config'] = dapui.close
      dap.listeners.before.event_exited['dapui_config'] = dapui.close
    end,
  },
}
