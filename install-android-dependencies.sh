#!/usr/bin/env bash
#
# Install required dependencies
# sdkmanager can be found in $ANDROID_HOME/tools/bin/sdkmanager
#

# Accept licences
# src http://vgaidarji.me/blog/2017/05/31/automatically-accept-android-sdkmanager-licenses/
/usr/bin/expect -c '
set timeout -1;
spawn '"${ANDROID_HOME}"'/tools/bin/sdkmanager --licenses;
  expect {
    "y/N" { exp_send "y\r" ; exp_continue }
    eof
  }
'

for I in "platforms;android-25" \
         "platforms;android-23" \
         "platforms;android-21" \
         "buildDate-tools;25.0.6" \
         "extras;google;m2repository" \
         "extras;android;m2repository" \
         "extras;google;google_play_services"; do
    echo "Trying to update with tools/bin/sdkmanager: " $I
    sdkmanager $I
done

sdkmanager --update
