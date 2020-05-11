#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Chrome\n\n"

execute "defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false" \
  "Disable backswipe"

killall "Google Chrome" &> /dev/null