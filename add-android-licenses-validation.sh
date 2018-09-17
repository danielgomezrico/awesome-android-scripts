#!/usr/bin/env bash
#
# Manually add android licenses acceptance
# source: https://discuss.bitrise.io/t/android-sdk-license-issue/97/2
#


mkdir -p $ANDROID_HOME/licenses
echo "8933bad161af4178b1185d1a37fbf41ea5269c55" > $ANDROID_HOME/licenses/android-sdk-license
echo "d56f5187479451eabf01fb78af6dfcb131a6481e" >> $ANDROID_HOME/licenses/android-sdk-license
