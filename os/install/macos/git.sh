#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../../utils.sh" \
  && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install "Git" "git"
brew_install "GitHub CLI" "github/gh/gh"
