# Installs Homebrew
if ! command -v brew &> /dev/null; then
  /bin/bash -c "$(NONINTERACTIVE=1 curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install brew dependencies
brew bundle

