#!/bin/bash

declare -A devices
devices=(["speackers"]="alsa_output.pci-0000_0b_00.4.analog-stereo" ["headset"]="SteelSeries_Arctis_7")
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

    device=$(pactl list short sinks | grep "${devices[$1]}" | cut -f 2)

    pactl set-default-sink "${device}"

    INPUTS=`pactl list sink-inputs short | cut -f 1`
    for i in $INPUTS; do
      pactl move-sink-input $i "${device}"
    done
    ;;
  ("switch")
    CURRENT_SINK=$(pactl get-default-sink)
    echo  $CURRENT_SINK
    [[ "${CURRENT_SINK}" = "${devices["speackers"]}" ]] && NEW_SINK="${devices["headset"]}" || NEW_SINK="${devices["speackers"]}"
    echo $NEW_SINK
    device=$(pactl list short sinks | grep "${NEW_SINK}" | cut -f 2)
    echo "hi"
    pactl set-default-sink "${device}"
    echo "h0"

    INPUTS=`pactl list sink-inputs short | cut -f 1`
    for i in $INPUTS; do
      pactl move-sink-input $i "${device}"
    done
    ;;
  (*)
    echo "Usage: $0 [|list|<sink name to switch to>]"
    ;;
esac

a=$([ "$b" == 5 ] && echo "$c" || echo "$d")