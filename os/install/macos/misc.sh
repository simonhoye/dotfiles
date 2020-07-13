#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../../utils.sh" \
  && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n Miscellaneous\n\n"

brew_install "1Password" "1password" "homebrew/cask" "cask"
brew_install "Cocoapods" "cocoapods" "homebrew/cask" "cask"
brew_install "Docker" "docker" "homebrew/cask" "cask"
brew_install "Jet CLI" "jet" "homebrew/cask" "cask"
brew_install "Joplin" "joplin" "homebrew/cask" "cask"
brew_install "LICEcap" "licecap" "homebrew/cask" "cask"
brew_install "Postman" "postman" "homebrew/cask" "cask"
brew_install "saml2aws" "saml2aws" "versent/homebrew-taps"
brew_install "Serverless Framework" "serverless"
brew_install "Skype for Business" "skype-for-business" "homebrew/cask" "cask"
brew_install "Virtual Box" "virtualbox" "homebrew/cask" "cask"
brew_install "Zoom"  "zoomus" "homebrew/cask" "cask"
