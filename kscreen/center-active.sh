#!/bin/bash

# LG 4K 60hz (DP-3) Scale: 150%
# LG 4K 120hz TV (HDMI-A-1) Scale: 100%
# Acer Predator 2K 144hz (DP-1) Scale: 100%

# Enable
kscreen-doctor output.DP-1.disable output.DP-3.disable output.HDMI-A-1.enable

# Set resolutions
kscreen-doctor output.HDMI-A-1.mode.3840x2160@120

# Set positions
kscreen-doctor output.HDMI-A-1.position.0,0

# Set priority
kscreen-doctor output.HDMI-A-1.primary

# Set scale
kscreen-doctor output.HDMI-A-1.scale.1
