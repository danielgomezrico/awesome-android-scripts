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

echo "--------------------------------------------------------"
echo "Trying to update dependencies with tools/bin/sdkmanager: "
echo "--------------------------------------------------------"

for I in "platforms;android-26" \
         "platforms;android-25" \
         "platforms;android-23" \
         "platforms;android-21" \
         "build-tools;26.0.1" \
         "tools" \
         "platform-tools" \
         "extras;google;m2repository" \
         "extras;android;m2repository" \
         "extras;google;google_play_services" \
         "extras;m2repository;com;android;support;constraint;constraint-layout;1.0.2"\
         "extras;m2repository;com;android;support;constraint;constraint-layout-solver;1.0.2"; do
    echo "-> " $I
    sdkmanager $I
done

sdkmanager --update

echo "--------------------------------------------------------"
