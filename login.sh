#!/usr/bin/env bash
#
# Helper to write user and pwd to login faster.
#

adb shell input text "d@d.d" # user
adb shell input keyevent 66 # next
adb shell input text "d" # user

adb shell input keyevent 66 # next
adb shell input keyevent 66 # enter