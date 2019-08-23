#!/bin/bash
set -e
download() {
  URL=https://raw.githubusercontent.com/mooizm/dotfiles/master/.bashrc
  curl --progress-bar -L $URL -o $HOME/myBash
}
copyover() {
  echo "$(cat $HOME/myBash)" >> $HOME/.bashrc
}
download
copyover
