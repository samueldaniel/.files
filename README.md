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

## Useful Factoids
---

.zshenv is always sourced. It often contains exported variables that should be available to other programs. For example, $PATH, $EDITOR, and $PAGER are often set in .zshenv. Also, you can set $ZDOTDIR in .zshenv to specify an alternative location for the rest of your zsh configuration.

.zprofile is for login shells. It is basically the same as .zlogin except that it's sourced before .zshrc whereas .zlogin is sourced after .zshrc. According to the zsh documentation, ".zprofile is meant as an alternative to .zlogin for ksh fans; the two are not intended to be used together, although this could certainly be done if desired."

.zshrc is for interactive shells. You set options for the interactive shell there with the setopt and unsetopt commands. You can also load shell modules, set your history options, change your prompt, set up zle and completion, et cetera. You also set any variables that are only used in the interactive shell (e.g. $LS_COLORS).

.zlogin is for login shells. It is sourced on the start of a login shell but after .zshrc, if the shell is also interactive. This file is often used to start X using startx. Some systems start X on boot, so this file is not always very useful.

.zlogout is sometimes used to clear and reset the terminal. It is called when exiting, not when opening.
