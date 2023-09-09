# .files
<p align="center">
dotfiles and config for zsh, ssh, tmux, neovim, nixos
</p>
<p align="center">
<b>⚠️ If you aren't @samueldaniel then this repo will not work out-of-the-box for you! Use it as inspiration! ⚠️</b>
</p>
<p align="center">
<img width="428" alt="dotfiles preview" src="https://user-images.githubusercontent.com/4551565/229550831-04724238-ca16-4741-a536-2bc0669c808c.png">
</p>

```
$ cd .files
$ ./bin/bootstrap.sh
<input sudo password>
$ sudo nixos-rebuild switch
```

macOS compatibility is ~~essentially broken~~ ~~straight up dead~~ **deprecated**. the `brew` script has not been brought to parity with `/etc/nixos/configuration.nix`. Don't bother using this for macOS. I left the scripts in for "legacy" reasons, i.e. "inspiration".

_*Probably don't use `/etc/nixos/hardware-configuration.nix` anywhere that isn't `neurofuzzy`?!?!?!*_

## [updating `nixos` packages](https://superuser.com/questions/1604694/how-to-update-every-package-on-nixos)

Check [Nix Channel Status page](https://status.nixos.org/) for latest channel info. Compare that to the output of:
```
sudo nix-channel --list
```

Remove any out of date channels:
```
sudo nix-channel --remove nixos
```

Add a new channel:
```
sudo nix-channel --add https://nixos.org/channels/nixos-21.11 nixos
```

Update:
```
sudo nix-channel --update
```

Updating your current channel as well as rebuilding and switching can be combined into one command:
```
sudo nixos-rebuild switch --upgrade
```

# TODO
- [ ] 🚩 figure out a better way of installing neovim on ubuntu that doesn't involve squashfs
- [ ] figure out a better way to control ubuntu config/installation
- [ ] figure out a way to script the installation of petalinux
- [ ] figure out a way to script the installation of awscli
- [ ] get nixOS/nix playing nicely with kernel modules
