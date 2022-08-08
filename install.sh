#!/bin/zsh
ZSHRC_LOCAL="~/.zshrc.local"


# Installs Homebrew
if ! command -v brew &> /dev/null; then
  /bin/bash -c "$(NONINTERACTIVE=1 curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install brew dependencies
brew bundle

# Configure dotfiles
rake install

# Adds Vim Plug plugin manager
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Keeps nvim plugins up todate
nvim --noplugin --headless -c 'PlugInstall' -c 'qa'

# Adds tmux plugins
rm -rf ~/.tmux/plugins/tpm && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

if ! cat ~/.zshrc | grep $ZSHRC_LOCAL &> /dev/null; then
  echo "\nsource $ZSHRC_LOCAL" >> ~/.zshrc
fi
