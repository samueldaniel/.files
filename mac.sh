#!/usr/bin/env bash
if [[ "$OSTYPE" == "darwin"* ]]; then
  cp .profile $HOME
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
  brew update
  brew install neovim
else
  echo "Unknown OSTYPE: ${OSTYPE}"
fi
