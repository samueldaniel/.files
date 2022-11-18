# .files
---
Clone this repo to `$HOME`.

Bootstrapping and dotfiles only support macOS at the moment - no Linux yet...
## `bin/brew.sh`
Install `homebrew` and various tools/libraries/etc.
## `bin/bootstrap.sh`
Copy everything from `$HOME/.files/home/` to `$HOME`.
## `bin/iterm_shell_integration.sh`
Install iTerm2 shell integration.
## `data/`
Container directory for random data files to install in different places.
## `home/`
Container directory for dotfiles, configs, etc. that will be rsynced over to `$HOME`.
