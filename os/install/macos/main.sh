#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "../../utils.sh" \
  && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

./xcode.sh
./homebrew.sh
./git.sh

./../nvm.sh
./../npm.sh

./browsers.sh
./misc.sh
./vscode.sh


./powerline_fonts.sh