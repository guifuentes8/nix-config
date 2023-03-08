{ lib, config, pkgs, ... }: {
 
services.xserver.windowManager.bspwm = {
    enable = true;
    package = pkgs.bspwm;
    configFile = "/home/guifuentes8/.config/bspwm/bspwmrc";
    sxhkd = {
      package = pkgs.sxhkd;
      configFile = "/home/guifuentes8/.config/sxhkd/sxhkdrc";
    };
};
}
