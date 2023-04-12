{ config, pkgs, ... }:

let 
  unstable = (import <nixos-unstable> { config = { allowUnfree = true; }; }).pkgs;
in rec
{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    ack
    bash
    bash-completion
    cargo
    cmake
    curl
    file
    findutils
    gcc
    git
    git-lfs
    gnugrep
    gnumake
    gnupg
    gnused
    hack-font
    htop
    iotop
    killall
    llvmPackages_15.libclang
    llvmPackages_15.llvm
    lsof
    moreutils
    nodejs
    nodePackages.yaml-language-server
    nerdfonts
    perl
    powerline-symbols
    (python310Full.withPackages(ps: with ps; [
      jedi-language-server
      pip
      pynvim
    ]))
    rnix-lsp
    ruby
    rustc
    tmux
    tree
    tree-sitter
    vim
    wget
    unstable.bat
    unstable.exa
    unstable.fd
    unstable.fzf
    unstable.neovim-unwrapped
    unstable.ripgrep
    zsh
    zsh-autosuggestions
    #zsh-async
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
