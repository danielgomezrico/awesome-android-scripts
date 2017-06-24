#!/usr/bin/env bash
#
# Copy ALL env variables to gradle properties file
# 
# You may want another output file then use PROPERTIES_FILE_PATH variable for that
# 
# Note: you can use System.getenv("VAR_NAME") instead of this if you dont need to create a local .properties files
# in your project.
#

PROPERTIES_FILE_PATH=gradle.properties

set +x // dont print the next lines on run script

printenv | tr ' ' '\n' > $PROPERTIES_FILE_PATH

set -x
