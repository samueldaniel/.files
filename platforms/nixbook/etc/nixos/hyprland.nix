{ config, pkgs, ... }:
{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;  # whether to enable XWayland
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.systemPackages = with pkgs; [
    dunst
    eww-wayland
    hyprpaper
    imv
    gBar.defaultPackage.x86_64-linux
    kitty
    libsForQt5.dolphin
    libsForQt5.qt5.qtwayland
    pipewire
    polkit-kde-agent
    qt6.qtwayland
    tofi
    wireplumber
    wofi
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
  ];
}
