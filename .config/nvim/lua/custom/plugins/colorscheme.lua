return {
  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('tokyonight').setup {
        styles = {
          comments = { italic = true }, -- Disable italics in comments
        },
      }

      -- Options: 'tokyonight', 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      vim.cmd.colorscheme 'tokyonight-night'
      vim.api.nvim_set_hl(0, 'Normal', { bg = '#151824' }) -- Custom background color
      vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#12141e' })
      vim.api.nvim_set_hl(0, 'Search', { fg = '#15161e', bg = '#7aa2f7' })
      vim.api.nvim_set_hl(0, '@markup.raw.markdown_inline', { link = 'CursorLineNr' })
      vim.api.nvim_set_hl(0, '@markup.link.markdown_inline', { link = 'Label' })
      vim.api.nvim_set_hl(0, 'NormalNC', { link = 'Normal' })

      -- Default menu settings
      vim.api.nvim_set_hl(0, 'Pmenu', { bg = '#3c3c3c', fg = '#c0c0c0' })
      vim.api.nvim_set_hl(0, 'PmenuSel', { link = 'CursorLine' })
      vim.api.nvim_set_hl(0, 'PmenuBorder', { link = 'LineNr' })

      -- Blink.cmp autocompletion theming
      vim.api.nvim_set_hl(0, 'BlinkCmpMenu', { link = 'VisualNC' })
      vim.api.nvim_set_hl(0, 'BlinkCmpDoc', { link = 'VisualNC' })
      vim.api.nvim_set_hl(0, 'BlinkCmpMenuSelection', { link = 'CursorLine' })
      vim.api.nvim_set_hl(0, 'BlinkCmpDocCursorLine', { link = 'CursorLine' })
      vim.api.nvim_set_hl(0, 'BlinkCmpMenuBorder', { link = 'Label' })
      vim.api.nvim_set_hl(0, 'BlinkCmpDocBorder', { link = 'Label' })

      vim.cmd 'highlight SignColumn guibg=NONE ctermbg=NONE'
    end,
  },
}
