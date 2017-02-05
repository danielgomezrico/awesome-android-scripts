#!/usr/bin/env bash
#
# Install required dependencies
# $ANDROID_HOME must be set to be cached on CI setup
#

DEPS_FILE="$ANDROID_HOME/android-dependencies-installed"

if [ ! -e $DEPS_FILE ]; then

  for I in android-25 \
           build-tools-25.0.2  \
           tool \
           extra-android-m2repository \
           extra-android-support \
           extra-google-google_play_services \
           extra-google-m2repository;
   do echo y | android update sdk --no-ui --all --filter $I ; done

   touch DEPS_FILE;

 fi
