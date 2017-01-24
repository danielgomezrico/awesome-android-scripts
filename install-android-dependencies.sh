#!/usr/bin/env bash
#
# Install JUST the required dependencies for the project.
# May be used for ci or other team members.
#

dependencies=(
      android-25
      build-tools-25.0.2
      tool
      extra-android-m2repository
      extra-android-support
      extra-google-google_play_services
      extra-google-m2repository
)

for dependency in "${dependencies[@]}"
do
  echo y | android update sdk --no-ui --all --filter $dependency
done