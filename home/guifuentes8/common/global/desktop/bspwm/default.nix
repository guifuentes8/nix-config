{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ../common
    ../../programs/wm
    ../../programs/wm/xorg
  ];


  services.xserver.windowManager.bspwm = {
    enable = true;
    package = pkgs.bspwm;
    configFile = ./bspwmrc;
    sxhkd = {
      package = pkgs.sxhkd;
      configFile = ./sxhkdrc;
    };

  }
