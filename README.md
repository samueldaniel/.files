# .files
## ⚠️ This repo most likely will not work out-of-the-box for you! Use it as inspiration! ⚠️
dotfiles and config for zsh, ssh, tmux, neovim, nixos

```
$ cd .files
$ ./bin/bootstrap.sh
<input sudo password>
$ sudo nixos-rebuild switch
```

macOS compatibility is essentially broken. the `brew` script needs to be updated with all the dependencies added to `/etc/nixos/configuration.nix`.

_*Probably don't use `/etc/nixos/hardware-configuration.nix` anywhere that isn't `neurofuzzy`?!?!?!*_
