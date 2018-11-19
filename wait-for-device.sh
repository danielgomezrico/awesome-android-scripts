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

awake_screen() {
  ANDROID_SDK_VERSION="$(adb shell getprop ro.build.version.sdk)"

  if [ "$ANDROID_SDK_VERSION" -gt 19 ]; then
    echo "Awaking android device."
    adb_all shell input keyevent 224 # KEYCODE_WAKEUP just for < Android 19
  else
    echo "Checking if its needed to turn on the screen."

    adb shell dumpsys power | grep -i 'Display Power: state=OFF'
    if [ $? -eq 0 ]; then
      echo "Screen is off. Wake up the phone"
      adb shell input keyevent 26 # KEYCODE_POWER will turn of if it is turned on
    else
      echo "Screen is on so no action required."
    fi
  fi
}

awake_screen
adb_all shell input keyevent 3 # HOME
adb_all shell input keyevent 4 # BACK
adb_all shell input keyevent 4 # BACK
adb_all shell input keyevent 4 # BACK

adb_all wait-for-device
adb_all shell 'while [[ -z $(getprop sys.boot_completed) ]]; do sleep 1; done;'
