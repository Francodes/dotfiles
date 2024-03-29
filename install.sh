#!/bin/zsh
ZSHRC_LOCAL="~/.zshrc.custom"

pathadd() {
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
      PATH="${PATH:+"$PATH:"}$1"
  fi
}

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

# Adds Vim Plug plugin manager
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Keeps nvim plugins up todate
nvim --noplugin --headless -c 'PlugInstall' -c 'qa'

# Install NPM packages
npm install
pathadd ./node_modules/.bin

if ! cat ~/.zshrc | grep $ZSHRC_LOCAL &> /dev/null; then
  echo "source $ZSHRC_LOCAL" >> ~/.zshrc
fi
