#!/usr/bin/env bash
#
# Disable all animations on connected devices with adb
#

adb_all () {
    adb devices | while read line
    do
        if [ ! "$line" = "" ] && [ `echo $line | awk '{print $2}'` = "device" ]
        then
            device=`echo $line | awk '{print $1}'`
            echo "$device $@ ..."
            adb -s $device $@ || true
        fi
    done
}

adb_all shell "settings put global window_animation_scale 0"
adb_all shell "settings put global transition_animation_scale 0"
adb_all shell "settings put global animator_duration_scale 0"
