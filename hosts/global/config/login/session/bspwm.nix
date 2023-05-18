{ pkgs, ... }:
{

  services.xserver = {
    displayManager.defaultSession = "none+bspwm";
    displayManager.session = [
      {
        manage = "window";
        name = "none+bspwm";
        start = ''exec $HOME/.xsession'';
      }
    ];
  };
}
