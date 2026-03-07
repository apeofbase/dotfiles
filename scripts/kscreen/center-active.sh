#!/bin/bash

# 'LG Electronics HDR 4K' 60hz Pos: 0,0 (2 DP-3) Scale: 150%
MONITOR_LG4K="DP-3"

# 'LG Electronics LG TV SSCR2' 120hz TV Pos: 2560,0 (3 HDMI-A-1) Scale: 100%
MONITOR_LGTV="HDMI-A-1"

# 'Acer Technologies XB271HU' 2K 144hz Pos: 6400,0 (1 DP-1) Scale: 100%
MONITOR_ACER="DP-1"

kscreen-doctor \
  output."${MONITOR_ACER}".disable output."${MONITOR_LG4K}".disable output."${MONITOR_LGTV}".enable \
  output."${MONITOR_LGTV}".mode.3840x2160@120 \
  output."${MONITOR_LGTV}".position.0,0 \
  output."${MONITOR_LGTV}".priority.1 \
  output."${MONITOR_LGTV}".scale.1
