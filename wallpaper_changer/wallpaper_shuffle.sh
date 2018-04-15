#!/usr/bin/env bash

BGPATH=$HOME/Pictures/wallpaper/*
SAVEBG=$HOME/.currentbg

bgselect=$(shuf -e $BGPATH | head -n1)

$(echo $bgselect > $SAVEBG)

feh --bg-scale $bgselect
