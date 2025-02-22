return {
  {

    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
    },

    config = function()
      local dap = require('dap')

      vim.api.nvim_set_hl(0, "DapBreakpoint", { link = 'Title' })
      vim.api.nvim_set_hl(0, "DapLogPoint", { link = 'DiagnosticInfo' })
      vim.api.nvim_set_hl(0, "DapStopped", { link = 'DiagnosticError' })

      vim.fn.sign_define('DapBreakpoint', { text='', texthl='DapBreakpoint', numhl='DapBreakpoint' })
      vim.fn.sign_define('DapBreakpointCondition', { text='󰋗', texthl='DapBreakpoint', numhl='DapBreakpoint' })
      vim.fn.sign_define('DapBreakpointRejected', { text='', texthl='DapBreakpoint', numhl= 'DapBreakpoint' })
      vim.fn.sign_define('DapLogPoint', { text='', texthl='DapLogPoint', numhl= 'DapLogPoint' })
      vim.fn.sign_define('DapStopped', { text='', texthl='DapStopped', numhl= 'DapStopped' })

      dap.adapters.php = {
        type = "executable",
        command = "node",
        args = { os.getenv("HOME") .. "/Repos/vscode-php-debug/out/phpDebug.js" }
      }

      dap.configurations.php = {
        {
          type = "php",
          request = "launch",
          name = "Listen for Xdebug",
          port = 9003,
          hostname = "0.0.0.0", -- or your host IP if needed
          pathMappings = {
            ["/var/www/html"] = "${workspaceFolder}" -- Adjust based on your DDEV project structure
          }
        }
      }
    end,
  }
}

