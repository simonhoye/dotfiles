#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../../utils.sh" \
  && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n Miscellaneous\n\n"

brew_install "Joplin" "joplin" "homebrew/cask" "cask"
brew_install "saml2aws" "saml2aws" "versent/homebrew-taps"
brew_install "Serverless Framework" "serverless"
brew_install "Zoom"  "zoomus" "homebrew/cask" "cask"