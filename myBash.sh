#!/bin/bash

set -e

download() {
  URL=https://github.com/mooizm/dotfiles/raw/master/.bashrc
  curl --progress-bar -L $URL -o $HOME/myBash
}

copyover() {
  echo "$(cat $HOME/myBash)" >> $HOME/.bashrc
}

removal() {
  rm $HOME/myBash
}

download
copyover
removal
