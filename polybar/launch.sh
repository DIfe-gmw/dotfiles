#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# Wait until finish
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2

dp1=$(xrandr --query | grep 'DP-1')
hdmi1=$(xrandr --query | grep 'HDMI-1')

if [[ $dp1 = *connected* ]]; then
	polybar example-dp1 &
fi

if [[ $hdmi1 = *connected* ]]; then
	polybar example-hdmi1 &
fi
echo "Bars launched..."
