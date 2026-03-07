#!/bin/bash

# 'LG Electronics HDR 4K' 60hz Pos: 0,0 (2 DP-3) Scale: 150%
MONITOR_LG4K="DP-3"

# 'LG Electronics LG TV SSCR2' 120hz TV Pos: 2560,0 (3 HDMI-A-1) Scale: 100%
MONITOR_LGTV="HDMI-A-1"

# 'Acer Technologies XB271HU' 2K 144hz Pos: 6400,0 (1 DP-1) Scale: 100%
MONITOR_ACER="DP-1"

kscreen-doctor \
  output."${MONITOR_ACER}".enable output."${MONITOR_LG4K}".enable output."${MONITOR_LGTV}".disable \
  output."${MONITOR_ACER}".mode.2560x1440@144 output."${MONITOR_LG4K}".mode.3840x2160@60 \
  output."${MONITOR_ACER}".position.2560,0 output."${MONITOR_LG4K}".position.0,0 \
  output."${MONITOR_ACER}".priority.1 \
  output."${MONITOR_ACER}".scale.1 output."${MONITOR_LG4K}".scale.1.5
