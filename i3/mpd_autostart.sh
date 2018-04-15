#!/bin/sh
# start mpd only if no other instance is running
[ ! -s ~/.config/mpd/pid ] && mpd
