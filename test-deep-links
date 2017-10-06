#!/usr/bin/env bash
#
# Send the needed event through adb to launch a deeplink.
#
#

COLOR_PURPLE='\033[0;35m'
COLOR_GREEN='\033[0;32m'
COLOR_OFF='\033[0m'

DEEP_LINKS=( "http://myapp.com/feed/504" \
             "http://myapp.com/profile/" \
)

print_step () {
  echo "${COLOR_PURPLE}\n---> $1: ${COLOR_OFF}"
}

print_item () {
  echo "- [${COLOR_GREEN}$1${COLOR_OFF}]: $2"
}

print_step "Supported deep links"
for i in "${!DEEP_LINKS[@]}"; do
  print_item $i "${DEEP_LINKS[$i]}"
done

print_step "Enter the index of the wanted deep link to test"
read INDEX

SELECTED_DEEP_LINK=${DEEP_LINKS[$INDEX]}

print_step "Selected"
echo "${SELECTED_DEEP_LINK}"

print_step "Sending..."
adb shell am start -a android.intent.action.VIEW \
                   -c android.intent.category.BROWSABLE  \
                   -d $SELECTED_DEEP_LINK


