#!/bin/bash

set -e
INSTALL_DIR="$HOME"

download() {
  URL=https://raw.githubusercontent.com/mooizm/dotfiles/master/.bashrc
  curl --progress-bar -L $URL -o $INSTALL_DIR
}

download
