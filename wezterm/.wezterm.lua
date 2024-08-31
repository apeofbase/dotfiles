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

  -- Color scheme
  color_scheme = 'Tokyo Night',

  -- Fonts
  font = wezterm.font 'DankMono Nerd Font',
  font_size = 16.0,
  line_height = 1.1,
  cell_width = 0.9,
  bold_brightens_ansi_colors = "BrightAndBold",

  -- Window
  enable_tab_bar = false,
  window_decorations = "RESIZE",
  window_background_opacity = 0.97,
  window_padding = {
    top = '1cell',
    right = '2cell',
    bottom = '0cell',
    left = '2cell',
  },

}

return config
