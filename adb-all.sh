#!/usr/bin/env bash
#
# Run adb on every connected device
#

adb devices | while read line
do
    if [ ! "$line" = "" ] && [ `echo $line | awk '{print $2}'` = "device" ]
    then
        device=`echo $line | awk '{print $1}'`
        echo "$device $@ ..."
        adb -s $device $@ || true
    fi
done
