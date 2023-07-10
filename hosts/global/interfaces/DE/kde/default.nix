{ pkgs, lib, ... }:

{
  services.xserver = {
    enable = true;
    desktopManager.plasma5 = {
      enable = true;
    };
  };

  programs.kdeconnect.enable = true;
  programs.dconf.enable = true;
  programs.partition-manager.enable = true;

  # default Kde Programs

  environment.systemPackages = (with pkgs.libsForQt5; [
    kmail
    kate
    ktorrent
    kmag
    akregator
    knotes
    kasts
    calindori
    kaccounts-integration
    kaccounts-providers
    kio-gdrive
  ]);

  environment.plasma5.excludePackages = with pkgs.libsForQt5; [
    plasma-browser-integration
  ];
}

