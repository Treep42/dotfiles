#!/usr/bin/env sh

# terminate all already running instances
killall -q polybar

# wait until they're all killed
while pgrep -u $UID -x polybar >/dev/nulL; do sleep 1; done

# launch bar(s)
polybar barleft &
polybar barright &

echo "Polybars launched"
