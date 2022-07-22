#!/bin/zsh
ZSHRC_LOCAL="~/.zshrc.local"

if [ "$SPIN" ]; then

  if ! command -v fzf &> /dev/null; then
    sudo apt-get install -y fzf
  fi

  if ! command -v ag &> /dev/null; then
    sudo apt-get install -y silversearcher-ag
  fi

else

  if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  if ! command -v fzf &> /dev/null; then
    brew install fzf
  fi

  if ! command -v ag &> /dev/null; then
    brew install the_silver_searcher
  fi

  if ! command -v zsh &> /dev/null; then
    brew install zsh
  fi

  if ! command -v tmux &> /dev/null; then
    brew install tmux
  fi

  if ! command -v node &> /dev/null; then
    brew install node
  fi

  if ! command -v zsh &> /dev/null; then
    brew install neovim
  fi
fi

if [ command -v gem &> /dev/null ]; then
  if ! command -v solargraph &> /dev/null; then
    gem install solargraph
  fi

  if ! command -v rubocop-lsp &> /dev/null; then
    gem install rubocop
    gem install rubocop-lsp
  fi

  if ! command -v srb &> /dev/null; then
    gem install srb
  fi
fi


ln -svf ~/dotfiles/.gitconfig ~/.gitconfig
ln -svf ~/dotfiles/vim.config/.* ~/
mkdir -p ~/.vim/autoload/
ln -svf ~/dotfiles/vim.config/plug.vim  ~/.vim/autoload/
ln -svf ~/dotfiles/nvim.config ~/.config/nvim

ln -svf ~/dotfiles/tmux.config/.* ~/

if ! cat ~/.zshrc | grep $ZSHRC_LOCAL &> /dev/null; then
  echo "\nsource $ZSHRC_LOCAL" >> ~/.zshrc
fi

ln -svf ~/dotfiles/zsh.config/.* ~/

nvim --headless +PlugInstall +qall
