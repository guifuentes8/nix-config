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

  # default Kde Programs
  environment.plasma5.excludePackages = with pkgs.libsForQt5; [

  ];
}

