return {
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },

    config = function()
      local nvim_tree = require 'nvim-tree'

      nvim_tree.setup {
        update_focused_file = {
          enable = true,
          update_cwd = false,
        },

        on_attach = function(bufnr)
          local api = require 'nvim-tree.api'

          local function opts(desc)
            return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
          end

          -- Default mappings
          api.config.mappings.default_on_attach(bufnr)

          -- Remove a default mappings
          vim.keymap.del('n', 's', { buffer = bufnr })
          vim.keymap.del('n', 'R', { buffer = bufnr })

          vim.keymap.set('n', '<C-r>', api.tree.reload, opts 'Open in Split')
          vim.keymap.set('n', 's', api.node.open.horizontal, opts 'Open in Split')
          vim.keymap.set('n', 'v', api.node.open.vertical, opts 'Open in VSplit')
          vim.keymap.set('n', 'R', api.fs.rename_full, opts 'Rename: Full Path')
          vim.keymap.set('n', 'O', api.node.run.system, opts 'Open System')
          vim.keymap.set('n', '?', api.tree.toggle_help, opts 'Help')
          -- vim.keymap.set('n', 'l', api.node.open.edit, opts 'Open')
          -- vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts 'Close node')
        end,

        view = {
          side = 'left',
          adaptive_size = true,
        },
      }

      -- Global mapping for toggle
      vim.keymap.set('n', '<C-b>', ':NvimTreeToggle<CR>', { desc = 'nvim-tree: Toggle', noremap = true, silent = true })
    end,
  },
}
