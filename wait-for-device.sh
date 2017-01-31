#!/usr/bin/env bash
#
# Run until a device is ready.
# src: http://android.stackexchange.com/a/164050/12512
#

adb wait-for-device
adb shell 'while [[ -z $(getprop sys.boot_completed) ]]; do sleep 1; done; input keyevent 82'