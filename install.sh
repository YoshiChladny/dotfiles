#! /usr/bin/env sh

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle


# Install global npm packages
sh ./node/global.sh

## Install and link iTerm2
echo "Setting up iTerm2 Theme...."
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/dotfiles/iterm"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

## install fish, fisher and set up functions
mkdir -p ~/.config/fish/functions  # Create directory for fish-shell
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish




## macos settings
echo "Setting up MacOS defaults..."
exec ./.macos

