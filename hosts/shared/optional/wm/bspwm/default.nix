{ lib, config, pkgs, ... }: {

  services.xserver.windowManager.bspwm = {
    enable = true;
    package = pkgs.bspwm;
    configFile = "/home/guifuentes8/.config/bspwm/bspwmrc";

  };
}
