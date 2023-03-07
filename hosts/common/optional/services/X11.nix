{ pkgs, ... }:
{
   services.xserver = {
    layout = "br";
    xkbVariant = "abnt2";
    enable = true;
    libinput.enable = true;
    excludePackages = [ pkgs.xterm ]; 

    displayManager.session = {
      defaultSession = "none+bspwm";
      session = [
        {
          manage = "desktop";
          name = "bspwm";
          start = ''exec $HOME/.xsession'';
        }
      ];
    };

};
}
