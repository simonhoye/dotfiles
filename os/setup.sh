#!/bin/bash

declare -r GITHUB_REPOSITORY="simonhoye/dotfiles"

declare -r DOTFILES_ORIGIN="git@github.com:$GITHUB_REPOSITORY.git"
declare -r DOTFILES_TARBALL_URL="https://github.com/$GITHUB_REPOSITORY/tarball/master"
declare -r DOTFILES_UTILS_URL="https://raw.githubusercontent.com/$GITHUB_REPOSITORY/master/os/utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

declare dotfilesDirectory="$HOME/dev/simonhoye/dotfiles"

download() {

  local url="$1"
  local output="$2"

  if command -v "curl" &> /dev/null; then

    curl -LsSo "$output" "$url" &> /dev/null
    #     │││└─ write output to file
    #     ││└─ show error messages
    #     │└─ don't show the progress meter
    #     └─ follow redirects

    return $?

  elif command -v "wget" &> /dev/null; then

    wget -qO "$output" "$url" &> /dev/null
    #     │└─ write output to file
    #     └─ don't show output

    return $?
  fi

  return 1

}


download_utils() {

  local tmpFile=""

  tmpFile="$(mktemp /tmp/XXXXX)"

  download "$DOTFILES_UTILS_URL" "$tmpFile" \
    && . "$tmpFile" \
    && rm -rf "$tmpFile" \
    && return 0

  return 1

}

verify_os() {
  declare -r MINIMUM_MACOS_VERSION="10.10"
  declare -r MINIMUM_UBUNTU_VERSION="18.04"

  local os_name="$(get_os)"
  local os_version="$(get_os_version)"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Check if the OS is `macOS` and
  # It's above the required version.

  if [ "$os_name"  == "macos" ]; then

    if is_supported_version "$os_version" "$MINIMUM_MACOS_VERSION"; then
      return 0
    else
      printf "Sorry, this script is intended only for macOS %s+" "$MINIMUM_MACOS_VERSION"
    fi
  fi
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
}

main() {

  # Ensure that the following actions
  # are made relative to this file's path.

  cd "$(dirname "${BASH_SOURCE[0]}")" \
      || exit 1

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  
  # Load utils

  if [ -x "utils.sh" ]; then
      . "utils.sh" || exit 1
  else
      download_utils || exit 1
  fi

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Ensure the OS is supported and
  # it's above the required version.

  verify_os \
      || exit 1

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  
  ask_for_sudo

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Check if this script was run directly (./<path>/setup.sh),
  # and if not, it most likely means that the dotfiles were not
  # yet set up, and they will need to be downloaded.

  #printf "%s" "${BASH_SOURCE[0]}" | grep "setup.sh" &> /dev/null \
  #  || download_dotfiles

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  #./create_symbolic_links.sh "$@"
  
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  ./install/main.sh

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  #./preferences/main.sh

}

main "$@"