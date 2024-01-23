{ config,
  fetchFromGitHub,
  installShellFiles,
  lib,
  pkgs,
  stdenv,
  ...
}:
let 
  unstable = (import <nixos-unstable> { config = { allowUnfree = true; }; }).pkgs;
in rec
{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    ack
    alacritty
    alacritty-theme
    avizo
    #bash
    #bash-completion
    brightnessctl
    cargo
    cmake
    bemenu
    curl
    file
    findutils
    gcc
    git
    git-lfs
    glow
    gnugrep
    gnumake
    gnupg
    gnused
    hack-font
    htop
    iotop
    killall
    #llvmPackages_15.libclang
    #llvmPackages_15.llvm
    lsof
    moreutils
    nodejs
    nodePackages.yaml-language-server
    nerdfonts
    perl
    powerline-symbols
    #pyenv
    rbenv
    #(python310Full.withPackages(ps: with ps; [
    #  jedi-language-server
    #  pip
    #  pynvim
    #]))
    rnix-lsp
    ruby
    rustc
    slack
    slurp
    sway-launcher-desktop
    tmux
    tree
    tree-sitter
    vim
    wget
    wl-clipboard
    unstable.bat
    unstable.eza
    unstable.fd
    unstable.fzf
    unstable.neovim-unwrapped
    unstable.ripgrep
    unzip
    waybar
    zsh
    zsh-autosuggestions
    zsh-completions
    zsh-git-prompt
    zsh-powerlevel10k
    zsh-syntax-highlighting

    # https://github.com/Decodetalkers/neocmakelsp
    # (rustPlatform.buildRustPackage {
    #   name = "neocmakelsp";
    #   version = "v0.5.11";
    #   src = pkgs.fetchFromGitHub {
    #     owner = "Decodetalkers";
    #     repo = "neocmakelsp";
    #     rev = "v0.5.11";
    #     sha256 = "sha256-LdTS0jG1HHOUhQZg4A4wfBD0tdx3dgtBF5VXIE+Fj6U=";
    #   }; 
    #   cargoSha256 = "sha256-hqyWMRjBKlyfHEr2soIBb+BJc6EnpLJwl/oGs1hqgf4=";
    # })
  ];
}
