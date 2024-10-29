return {
  {
    "nvim-telescope/telescope.nvim",

    dependencies = {
      {
      -- grep with arguments
      'nvim-telescope/telescope-live-grep-args.nvim', version = '^1.0.0',
      --  Use telescope for UI
      'nvim-telescope/telescope-ui-select.nvim', commit = '6e51d7da30bd139a6950adf2a47fda6df9fa06d26e51d7da30bd139a6950adf2a47fda6df9fa06d2',
      -- Useful lua functions used by lots of plugins
      'nvim-lua/plenary.nvim', tag = "v0.1.4",
      },
    },

    opts = function(_, conf)
      conf.defaults.path_display = {
        "truncate"
      }

      conf.defaults.mappings.i = {
        ["<C-k>"] = require("telescope.actions").move_selection_previous,
        ["<C-j>"] = require("telescope.actions").move_selection_next,
        ["<C-n>"] = require("telescope.actions").cycle_history_next,
        ["<C-p>"] = require("telescope.actions").cycle_history_prev,
        ["<ESC>"] = require("telescope.actions").close,
        ["<C-t>"] = require("telescope.actions.layout").toggle_preview,
      }

      conf.pickers = {
        find_files = {
          find_command = { "rg", "--files", "--hidden", "--glob", "!**/node_modules/*", "--glob", "!**/.git/*" },
        },
      }

      conf.extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {}
        }
      }

      require("telescope").load_extension("live_grep_args")
      require("telescope").load_extension("ui-select")

      return conf
    end,
  }
}
