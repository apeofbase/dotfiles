return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = true,
      -- format_on_save = function(bufnr)
      --   -- Disable "format_on_save lsp_fallback" for languages that don't
      --   -- have a well standardized coding style. You can add additional
      --   -- languages here or re-enable it for the disabled ones.
      --   local disable_filetypes = { c = true, cpp = true }
      --   if disable_filetypes[vim.bo[bufnr].filetype] then
      --     return nil
      --   else
      --     return {
      --       timeout_ms = 500,
      --       lsp_format = 'fallback',
      --     }
      --   end
      -- end,
      formatters_by_ft = {
        lua = { 'stylua' },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use 'stop_after_first' to run the first available formatter from the list
        javascript = { 'prettier', stop_after_first = true },
        php = { 'phpcbf' },
        scss = { 'stylelint' },
        css = { 'stylelint' },
      },
      formatters = {
        -- Install composer dependencies in project
        --  `composer require --dev drupal/coder slevomat/coding-standard`
        phpcbf = {
          command = './vendor/bin/phpcbf',
          args = {
            '--runtime-set',
            'installed_paths',
            vim.fn.getcwd() .. '/vendor/drupal/coder/coder_sniffer,' .. vim.fn.getcwd() .. '/vendor/slevomat/coding-standard',
            '--standard=Drupal',
            '--report=emacs',
            '-',
          },
          stdin = true,
          cwd = function()
            return vim.fn.getcwd()
          end,
        },

        -- Add .stylelintrc to project
        -- Install npm dependencies
        --  `npm install --save-dev --legacy-peer-deps stylelint stylelint-scss stylelint-config-standard-scss stylelint-config-drupal`
        stylelint = {
          command = 'stylelint',
          args = { '--fix', '--stdin', '--stdin-filename', '$FILENAME' },
          stdin = true,
        },
      },
    },
  },
}
