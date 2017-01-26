#!/usr/bin/env bash
#
# Install JUST the required dependencies for the project.
# May be used for ci or other team members.
#

for I in android-25 \
         build-tools-25.0.2  \
         tool \
         extra-android-m2repository \
         extra-android-support \
         extra-google-google_play_services \
         extra-google-m2repository;

 do echo y | android update sdk --no-ui --all --filter $I ; done