#!/bin/zsh
if ! command -v ag &> /dev/null; then
  sudo apt-get install -y silversearcher-ag
fi

rake install

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

nvim --noplugin --headless -c 'PlugInstall' -c 'qa'

rm -rf ~/.tmux/plugins/tpm && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
