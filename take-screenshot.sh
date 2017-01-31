#!/usr/bin/env bash
#
# Take an screenshot into "screenshots/" using current date/time as file name.
# src: https://gist.github.com/FokkeZB/86713457bf84808a12a6
#

adb shell screencap -p | perl -pe "s/\x0D\x0A/\x0A/g" > "screenshots/$(date +%Y%m%d-%H%M%S).png"