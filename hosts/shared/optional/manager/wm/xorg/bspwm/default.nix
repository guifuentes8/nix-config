{ lib, config, pkgs, ... }: {

  services.xserver.windowManager.bspwm = {
    enable = true;
    package = pkgs.bspwm;
    configFile = "~/.config/bspwm/bspwmrc";

  };
}
