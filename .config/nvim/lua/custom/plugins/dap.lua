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
      vim.keymap.set('n', '<leader>dc', function()
        require('dap').continue()
      end, { noremap = true, desc = '[D]ebug [C]ontinue' })

      vim.keymap.set('n', '<leader>b', function()
        require('dap').toggle_breakpoint()
      end, { noremap = true, desc = 'Debug Toggle [B]reakpoint' })

      vim.keymap.set({ 'n', 'v' }, '<Leader>du', function()
        require('dapui').toggle()
      end, { desc = '[D]ebug [U]I Toggle' })

      vim.keymap.set('n', '<Leader>dr', function()
        require('dap').repl.open()
      end, { desc = '[D]ebug [R]epl' })

      -- vim.keymap.set('n', '<Leader>df', ':Telescope dap frames<CR>', { desc = '[D]ebug [F]rames' })
      --
      -- vim.keymap.set('n', '<Leader>ds', function()
      --   local widgets = require 'dap.ui.widgets'
      --   widgets.centered_float(widgets.scopes)
      -- end, { desc = '[D]ebug [S]copes' })

      -- vim.keymap.set('n', '<Leader>dl', ':Telescope dap list_breakpoints<CR>', { desc = '[D]ebug [L]ist Breakpoints' })

      vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
        require('dap.ui.widgets').hover()
      end, { desc = '[D]ebug [H]over' })

      vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
        require('dap.ui.widgets').preview()
      end, { desc = '[D]ebug [P]review' })

      vim.keymap.set({ 'n', 'v' }, '<Leader>dx', ':DapTerminate<CR>', { desc = '[D]ebug E[x]terminate session' })

      vim.keymap.set({ 'n', 'v' }, '<Leader>dB', ':DapClearBreakpoints<CR>', { desc = '[D]ebug Clear [B]reakpoints' })

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
        -- Set icons to characters that are more likely to work in every terminal.
        --    Feel free to remove or use ones that you like more! :)
        --    Don't feel like these are good choices.
        icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
        controls = {
          icons = {
            pause = '⏸',
            play = '▶',
            step_into = '⏎',
            step_over = '⏭',
            step_out = '⏮',
            step_back = 'b',
            run_last = '▶▶',
            terminate = '⏹',
            disconnect = '⏏',
          },
        },
        layouts = {
          {
            elements = {
              { id = 'scopes', size = 0.25 },
              { id = 'breakpoints', size = 0.25 },
              { id = 'stacks', size = 0.25 },
              { id = 'watches', size = 0.25 },
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
