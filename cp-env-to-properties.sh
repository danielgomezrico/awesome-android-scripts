#!/usr/bin/env bash
#
# Copy ALL env variables to gradle properties file
# 
# Useful to setup easy any CI service.
# 
# You may want another output file then use PROPERTIES_FILE_PATH variable for that
#

PROPERTIES_FILE_PATH=gradle.properties

set +x // dont print the next lines on run script

printenv | tr ' ' '\n' > $PROPERTIES_FILE_PATH

set -x
