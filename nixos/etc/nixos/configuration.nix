{ config, lib, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ./sway.nix
      ./system-packages.nix
    ];

  nix = {
   package = pkgs.nixFlakes;
   extraOptions = lib.optionalString (config.nix.package == pkgs.nixFlakes)
     "experimental-features = nix-command flakes";
   optimise = {
     automatic = true;
   };
  };
  nixpkgs.config.allowUnfree = true;
  hardware.parallels.enable = true;

  programs.sway.enable = true;
  security.rtkit.enable = true;
  services.dbus.enable = true;
  security.polkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
    ];
  };
  environment.loginShellInit = ''
    [[ "$(tty)" == /dev/tty1 ]] && sway
  '';
  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "Hack" ]; })
  ];

  programs.firefox.enable = true;

  # Use the systemd-boot EFI boot loader.
  boot.initrd.systemd.enable = true;
  boot.loader.systemd-boot.enable = true;
  #boot.loader.efi.canTouchEfiVariables = true;
  #boot.loader.grub = {
  #  font = "${pkgs.nerdfonts}/share/fonts/truetype/NerdFonts/HackNerdFontMono-Regular.ttf";
  #  fontSize = 10;
  #};

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

  i18n.defaultLocale = "en_US.UTF-8";
  #console = {
  #  earlySetup = true;
  #  packages = [
  #    pkgs.nerdfonts
  #  ];
  #  font = "${pkgs.nerdfonts}/share/fonts/truetype/NerdFonts/HackNerdFontMono-Regular.ttf";
  #};

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

  programs.zsh = {
    enable = true;
    enableCompletion = true;
  };

  #virtualisation.docker.enable = true;
  #virtualisation.docker.rootless = {
  #  enable = true;
  #  setSocketVariable = true;
  #};

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.sam = {
    isNormalUser = true;
    extraGroups = [
      #"docker"
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
  services.openssh = {
    enable = true;
    #PermitRootLogin = "no";
    #PasswordAuthentication = false;
    #KbdInteractiveAuthentication = false;
    #X11Forwarding = true;
  };
  programs.ssh.startAgent = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 22 ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

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
  system.stateVersion = "23.05"; # Did you read the comment?

}
