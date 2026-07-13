#!/bin/sh

defaults write NSGlobalDomain AppleEnableSwipeNavigateWithScrolls -bool false

defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock orientation -string "left"

defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

killall Dock Finder SystemUIServer || true
