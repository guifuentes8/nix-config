{ pkgs, ... }:

{
  xserver.displayManager = {
    gdm.enable = true;
  };
}
