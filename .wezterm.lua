-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- Setup config
local config = wezterm.config_builder()

config = {
  -- Colors
  colors = {
    cursor_bg = '#acb0d0',
    cursor_fg = 'black',

    selection_bg = '#e0af68',
    selection_fg = 'black',

    background = '#151824',
    foreground = '#a9b1d6',
    ansi = {
      '#32344a', -- black
      '#f7768e', -- red
      '#9ece6a', -- green
      '#e0af68', -- yellow
      '#7aa2f7', -- blue
      '#ad8ee6', -- magenta
      '#449dab', -- cyan
      '#787c99', -- white
    },
    brights = {
      '#444b6a', -- black
      '#ff7a93', -- red
      '#b9f27c', -- green
      '#ff9e64', -- yellow
      '#7da6ff', -- blue
      '#bb9af7', -- magenta
      '#0db9d7', -- cyan
      '#acb0d0', -- white
    },
  },


  -- Fonts
  -- yay -S maplemono-nf-unhinted
  -- brew install --cask font-maple-mono-nf
  font = wezterm.font_with_fallback {
    "Maple Mono NF",
    "DankMono Nerd Font", -- fallback for icons
  },
  font_size = 13.0,
  line_height = 1.15,
  cell_width = 1.0,
  bold_brightens_ansi_colors = "BrightAndBold",

  -- Window
  enable_tab_bar = false,
  window_decorations = "RESIZE",
  window_background_opacity = 1.0,
  window_padding = {
    top = '1cell',
    right = '2cell',
    bottom = '0cell',
    left = '2cell',
  },

}

return config
