return {
  {

    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
    },

    config = function()
      local dap = require('dap')

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

