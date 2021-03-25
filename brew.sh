#!/usr/bin/env bash

# Install Homebrew (if not installed)
echo "Installing Homebrew."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed` as gsed
brew install gnu-sed

# Install `wget` with IRI support.
brew install wget --with-iri

brew install gmp
brew install grep
brew install node

# Install useful binaries.
brew install postgresql
brew install the_silver_searcher
brew install autojump
brew install ffmpeg
brew install git
brew install github/gh/gh
brew install imagemagick --with-webp
brew install pigz
brew install yarn
brew install tmux
brew install direnv
brew install asdf
brew install prettier
brew install docker-compose
brew install awscli
brew install poppler

# Installs Casks
brew tap homebrew/cask

## Apps I use
brew install --cask 1password
brew install --cask docker
brew install --cask google-chrome # Chrome
brew install --cask kap
brew install --cask slack
brew install --cask zoom

# Remove outdated versions from the cellar.
brew cleanup
