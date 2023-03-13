{ pkgs, ... }:
{
  services.screen-locker = {
    enable = true;
    xautolock.enable = true;
  };

  services.betterlockscreen = {
    enable = true;
    arguments = [ "blur" ];
  };

}

