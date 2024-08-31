-- Pull in the wezterm API
local wezterm = require 'wezterm'
local mux = wezterm.mux

-- Startup with maximized window
wezterm.on('gui-startup', function(cmd)
  local window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

-- Setup config
local config = wezterm.config_builder()

config = {

  -- Colors
  colors = {
    cursor_bg = '#acb0d0',
    cursor_fg = 'black',

    selection_bg = '#e0af68',
    selection_fg = 'black',

    background = '#1a1b26',
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
  font = wezterm.font 'DankMono Nerd Font',
  font_size = 15.0,
  line_height = 1.1,
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
