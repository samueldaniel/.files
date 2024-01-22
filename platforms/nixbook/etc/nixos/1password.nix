{ config, lib, pkgs, ... }:
{
  # enable the unfree 1Password packages
  #nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
  #  "1password-gui"
  #  "1password"
  #];
  # Or allow all unfree packages (which is done already in my configuration.nix)

  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    # Certain features, including CLI integration and system authentication support,
    # require enabling PolKit integration on some desktop environments (e.g. Plasma).
    polkitPolicyOwners = [ "sam" ];
  };

}

