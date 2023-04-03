# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let unstable = (import <nixos-unstable> { config = { allowUnfree = true; }; }).pkgs;
in rec
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./sway.nix
    ];

  boot.initrd.luks.devices = {
    root = {
      device = "/dev/nvme0n1p2";
      preLVM = true;
    };
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelParams = [ "i915.force_probe=4680" ];

  # networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  networking.hostName = "neurofuzzy";

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkbOptions in tty.
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = {
  #   "eurosign:e";
  #   "caps:escape" # map caps to escape.
  # };

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

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
    #pure-prompt
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

  programs.zsh = {
    enable = true;
    enableCompletion = true;
  };

  virtualisation.docker.enable = true;
  #virtualisation.docker.rootless = {
  #  enable = true;
  #  setSocketVariable = true;
  #};

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.sam = {
    isNormalUser = true;
    extraGroups = [
      "docker"
      "wheel" # Enable ‘sudo’ for the user.
    ];
    shell = pkgs.zsh;
   # packages = with pkgs; [
   #   firefox
   #   thunderbird
   # ];
  };

  # Many programs look at /etc/shells to determine if a user is a "normal" user and not a "system" user. Therefore it is recommended to add the user shells to this list. 
  environment.shells = [ pkgs.zsh ];
  environment.etc."zsh-powerlevel10k.zsh-theme".source = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  programs.ssh.startAgent = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?

}
