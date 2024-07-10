#!/bin/bash

# LG 4K 60hz Pos: 0,0 (2 DP-3) Scale: 150%
# LG 4K 120hz TV Pos: 2560,0 (3 HDMI-A-1) Scale: 100%
# Acer Predator 2K 144hz Pos: 6400,0 (1 DP-1) Scale: 100%

# Enable
kscreen-doctor output.DP-1.enable output.DP-3.enable output.HDMI-A-1.enable

# Set resolutions
kscreen-doctor output.DP-1.mode.2560x1440@144 output.DP-3.mode.3840x2160@60 output.HDMI-A-1.mode.3840x2160@120

# Set positions
kscreen-doctor output.DP-1.position.6400,0 output.DP-3.position.0,0 output.HDMI-A-1.position.2560,0

# Set priority
kscreen-doctor output.HDMI-A-1.primary

# Set scale
kscreen-doctor output.DP-1.scale.1 output.DP-3.scale.1.5 output.HDMI-A-1.scale.1
