{ pkgs, ... }:
{
  services.betterlockscreen = {
    enable = true;
    # inactiveInterval = 1;
    arguments = [ "blur" "pixel" ];
  };
}
