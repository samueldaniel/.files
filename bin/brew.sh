#!/usr/bin/env bash
if [[ "$OSTYPE" != "darwin"* ]]; then
  echo "Unknown OSTYPE: ${OSTYPE}"
  exit 1
fi

# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"
brew update

# Upgrade any already-installed formulae.
brew upgrade


# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
echo 'Be sure to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.'
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
# https://www.putorius.net/moreutils.html
brew install moreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
echo 'Add `$(brew --prefix findutils)/libexec/gnubin` to `$PATH` if you would prefer these be the defaults.'
# https://www.gnu.org/software/findutils/
brew install findutils

# Install GNU `sed`, overwriting the built-in `sed`.
echo 'Be sure to add `$(brew --prefix gnu-sed)/libexec/gnubin` to `$PATH`.'
brew install gnu-sed

# Install a modern version of Bash.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
#if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
#  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
#  chsh -s "${BREW_PREFIX}/bin/bash";
#fi;

# Install/update zsh
brew install zsh
echo 'Make sure zsh-git-prompt is loaded from your .zshrc:'
echo 'source "/opt/homebrew/opt/zsh-git-prompt/zshrc.sh"'
brew install zsh-git-prompt
brew install zsh-fast-syntax-highlighting
brew install zsh-autosuggestions
brew install zsh-completions
brew install zsh-async

# Install `wget` with IRI support.
brew install wget

# Install GnuPG to enable PGP-signing commits.
brew install gnupg
brew install --cask gpg-suite

# Install more recent versions of some macOS tools.
brew install grep
brew install openssh
brew install screen

# Install other useful binaries.
brew install ack
brew install git
brew install git-lfs

# fonts!
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
brew install --cask font-powerline-symbols

brew install fzf
/opt/homebrew/opt/fzf/install --all --key-bindings --completion --no-update-rc
brew install neovim
brew install tmux
brew install pyenv

# Casks
#brew install --cask dropbox
#brew install --cask google-chrome
#brew install --cask intel-power-gadget
#brew install --cask istat-menus
#brew install --cask iterm2
#brew install --cask signal
#brew install --cask slack
#brew install --cask transmission
#brew install --cask visual-studio-code
#brew install --cask vlc

# Remove outdated versions from the cellar.
brew cleanup
