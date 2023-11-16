{ pkgs, ... }:
{
  services.screen-locker = {
    enable = true;
    xautolock.enable = true;
    lockCmd = "\${pkgs.i3lock}/bin/i3lock -n -c 000000";
  };

}

