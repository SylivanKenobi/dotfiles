#!/bin/bash

case "${1:-}" in
  (""|list)
    pactl list short sinks
    ;;
  ([0-9]*)
    SINKS=$(pactl list short sinks | grep -v easyeffects)
    NEW_SINK=$(echo "$SINKS" | sed "${1}q;d" | awk '{ print $2 }')
    pactl set-default-sink "$NEW_SINK"
    ;;
  ("speackers"|"headset"|"buds")
    SINKS=$(pactl list short sinks | grep -v easyeffects)
    declare -A devices
    devices=(["speackers"]="alsa_output.pci-0000_00_1f.3.analog-stereo" ["headset"]="alsa_output.usb-SteelSeries_Arctis_7_-00.analog-stereo" ["buds"]="bluez_output.C4_5D_83_A8_81_16.1")
    pactl set-default-sink "${devices[$1]}"
    ;;
  (*)
    echo "Usage: $0 [|list|<sink name to switch to>]"
    ;;
esac
cd 
