#!/bin/zsh
ZSHRC_LOCAL="~/.zshrc.custom"

if [[ `uname` == "Darwin" ]]; then
  curdir=$(pwd)
  cd macos
  sh ./install.sh
  cd $curdir
fi

if [[ `uname` == "Linux" ]]; then
  curdir=$(pwd)
  cd linux
  sh ./install.sh
  cd $curdir
fi

# Configure dotfiles
rake install

# Keeps nvim plugins up todate
nvim --headless "+Lazy! sync" +qa

# Keeps herdr plugins installed/updated (idempotent; skipped if herdr is absent)
if command -v herdr >/dev/null 2>&1; then
  herdr plugin install paulbkim-dev/vim-herdr-navigation --yes
  herdr plugin install persiyanov/herdr-reviewr --yes
fi

if ! cat ~/.zshrc | grep $ZSHRC_LOCAL &> /dev/null; then
  echo "source $ZSHRC_LOCAL" >> ~/.zshrc
fi
