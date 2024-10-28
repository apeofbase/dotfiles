return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },

    opts = {
      update_focused_file = {
        enable = true,
        update_cwd = false,
      },

      on_attach = function(bufnr)
        local api = require "nvim-tree.api"

        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        -- default mappings
        api.config.mappings.default_on_attach(bufnr)

        -- custom mappings
        vim.keymap.set("n", "v", api.node.open.vertical, opts("Open in VSplit"))
        vim.keymap.set("n", "s", api.node.open.horizontal, opts("Open in Split"))
        vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
        vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
        vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
        vim.keymap.set("n", "O", api.node.run.system, opts("Open System"))
        vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close node"))
      end,

      view = {
        side = "left",
        adaptive_size = true,
      },
    }
  }
}
