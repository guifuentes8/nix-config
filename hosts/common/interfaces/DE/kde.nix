{ pkgs, unstable, lib, ... }:

{
  imports = [ ];
  services.xserver = {
    enable = true;
    desktopManager.plasma5 = { enable = true; };
  };

  services.xserver.displayManager.defaultSession = "plasmawayland";

  programs.dconf.enable = true;
  programs.partition-manager.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # default Kde Programs

  environment.systemPackages = (with pkgs.kdePackages; [
    kmail
    kdenlive
    kate
    ktorrent
    kmag
    akregator
    knotes
    kasts
    kaccounts-integration
    kaccounts-providers
    kio-gdrive
    dragon
    audiotube
  ]);

  environment.plasma5.excludePackages = with pkgs.libsForQt5;
    [ plasma-browser-integration ];
}

