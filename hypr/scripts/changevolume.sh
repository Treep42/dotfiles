#!/bin/bash
appname="chgvol"

option=$1

if [[ "$#" -gt 1 ]]; then
    step=$2
else
    step=5
fi

case $option in
    up) wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ $step%+;
    ;;
    down) wpctl set-volume @DEFAULT_AUDIO_SINK@ $step%-;
    ;;
    togglemute) wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle;
    ;;
    togglemic) wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle;
    ;;
    *) echo "unknown option: $option"; exit 1
    ;;
esac

# use wireplumber to get current volume (as integer) and mute status
volume="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}' | sed -E 's/^[01]\.//g')"
mute="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $3}')"
micmute="$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | awk '{print $3}')"

# message tag to use for dunst so recurring notifications are stacked
msgTag="myvolume"
dunstcommonopts="-a $appname -u low -t 3000 -h string:x-dunst-stack-tag:$msgTag"
# show the relevant notifications using dunstify
if [[ "$option" == "togglemic" && "$micmute" == "[MUTED]" ]]; then
    dunstify $dunstcommonopts -i microphone-sensitivity-muted "microphone muted"
elif [[ "$option" == "togglemic" && "$micmute" == "" ]]; then
    dunstify $dunstcommonopts -i microphone-sensitivity-high "microphone unmuted"
elif [[ $volume == 0 || "$mute" == "[MUTED]" ]]; then
    dunstify $dunstcommonopts -i audio-volume-muted "muted"
else
    dunstify $dunstcommonopts -h int:value:"$volume" -i audio-volume-high "volume: ${volume}%"
fi

# Play the volume changed sound
# canberra-gtk-play -i audio-volume-change -d "changeVolume"
