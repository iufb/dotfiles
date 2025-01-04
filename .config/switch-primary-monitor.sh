#!/bin/bash

# Automatically fetch connected monitors
MONITORS=($(xrandr --listmonitors | awk 'NR>1 {print $NF}'))

# Check if there are at least two monitors connected
if [ "${#MONITORS[@]}" -lt 2 ]; then
    echo "Less than two monitors are connected. Exiting."
    exit 1
fi

MONITOR1=${MONITORS[0]}
MONITOR2=${MONITORS[1]}

# Define sound profiles (you may need to adjust these manually)
SOUND2="alsa_output.pci-0000_2d_00.4.analog-stereo"
SOUND1="alsa_output.pci-0000_2b_00.1.hdmi-stereo"

# Get the current primary monitor
CURRENT_PRIMARY=$(xrandr --current | grep "primary" | awk '{ print $1 }')
echo "CURRENT $CURRENT_PRIMARY , 1 - $MONITOR1 , 2 - $MONITOR2"

if [ "$CURRENT_PRIMARY" = "$MONITOR1" ]; then
    xrandr --output $MONITOR2 --primary
    pactl set-default-sink $SOUND2
else
    xrandr --output $MONITOR1 --primary
    pactl set-default-sink $SOUND1
fi

