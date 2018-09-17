#!/usr/bin/env bash
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

adb_all shell input keyevent 26 # KEYCODE_POWER
adb_all shell input keyevent 3 # HOME
adb_all wait-for-device
adb_all shell 'while [[ -z $(getprop sys.boot_completed) ]]; do sleep 1; done; input keyevent 82'
