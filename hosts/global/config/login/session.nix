{ pkgs, ... }:
{

  services.xserver = {
    displayManager.defaultSession = "none+bspwm";
    displayManager.session = [
      {
        manage = "desktop";
        name = "none+bspwm";
        start = ''exec $HOME/.xsession'';
      }
    ];
  };
}
