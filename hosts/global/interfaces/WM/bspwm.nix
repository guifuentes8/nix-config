{ config, ... }: {

  imports = [ ./shared ];

  services.xserver = {
    enable = true;
    windowManager.bspwm = { enable = true; };
  };
}
