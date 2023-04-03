# .files
---
dotfiles and config for zsh, ssh, tmux, neovim, nixos

```
$ cd .files
$ ./bin/bootstrap.sh
<input sudo password>
$ sudo nixos-rebuild switch
```

macOS compatibility is essentially broken. the `brew` script needs to be updated with all the dependencies added to `/etc/nixos/configuration.nix`.


_*Don't use `/etc/nixos/hardware-configuration.nix` anywhere that isn't `neurofuzzy`!!!*_
