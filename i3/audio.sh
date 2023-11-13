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
  ("speackers"|"headset")
    SINKS=$(pactl list short sinks | grep -v easyeffects)
    declare -A devices
    devices=(["speackers"]="pci-0000_08_00.4.analog-stereo" ["headset"]="SteelSeries_Arctis_7")

    device=$(pactl list short sinks | grep "${devices[$1]}" | cut -f 2)

    pactl set-default-sink "${device}"

    INPUTS=`pactl list sink-inputs short | cut -f 1`
    for i in $INPUTS; do
      pactl move-sink-input $i "${device}"
    done
    ;;
  (*)
    echo "Usage: $0 [|list|<sink name to switch to>]"
    ;;
esac

