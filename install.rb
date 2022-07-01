#!/usr/bin/env ruby

def print_cyan(text); puts "\e[36m#{text}\e[0m"; end;
def print_red(text); puts "\e[31m#{text}\e[0m"; end;

print_cyan "Checking if brew exists..."
if `which brew`.include? "not found"
  print_red "Installing brew"
  `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
end

print_cyan "Checking if node exists..."
if `which node`.include? "not found"
  print_red "Installing node"
  `brew install node`
end

print_cyan "Checking if ag exists..."
if `which ag`.include? "not found"
  print_red "Installing ag"
  `brew install the_silver_searcher`
end

print_cyan "Checking if zsh is installed"
if `which zsh`.include? "not found"
  print_red "Installing zsh"
  `sudo apt-get install zsh`
  `sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"`
end

print_cyan "Checking if nvim exists..."
if `which nvim`.include? "not found"
  print_red "Installing nvim"
  `brew install neovim`
end

print_cyan "Copying vim.config"
`ln -svf ~/dotfiles/vim.config/.vimrc ~/.vimrc`
`ln -svf ~/dotfiles/vim.config/.vimrc.coc ~/.vimrc.coc`
`ln -svf ~/dotfiles/vim.config/.vimrc.local ~/.vimrc.local`
`ln -svf ~/dotfiles/vim.config/.vimrc.plugs ~/.vimrc.plugs`
`mkdir -p ~/.vim/autoload/`
`ln -svf ~/dotfiles/vim.config/plug.vim  ~/.vim/autoload/`

print_cyan "Checking if zsh.config is copied..."
unless `cat ~/.zshrc`.include? ".zshrc.local"
  print_red "Copying zsh.config"
  `ln -svf ~/dotfiles/zsh.config/.zshrc.local ~/.zshrc.local`
  `ln -svf ~/dotfiles/zsh.config/.zshrc.aliases ~/.zshrc.aliases`
  `ln -svf ~/dotfiles/zsh.config/.zshrc.custom ~/.zshrc.custom`
  `echo "source ~/.zshrc.local" >> ~/.zshrc`
end

print_cyan "Copying tmux.config"
`ln -svf ~/dotfiles/tmux.config/.tmux.conf ~/.tmux.conf`

print_cyan "Copying nvim.config"
`ln -svf ~/dotfiles/nvim.config ~/.config/nvim`

print_cyan "Copying .gitconfig"
`ln -svf ~/dotfiles/.gitconfig ~/.gitconfig`

print_cyan "Copying .global_gitignore"
`ln -svf ~/dotfiles/.global_gitignore ~/.global_gitignore`
