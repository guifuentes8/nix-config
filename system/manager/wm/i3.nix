{ pkgs, ... }:

{
  xserver.windowManager = {
    i3 = {
      enable = true;
      extraPackages = with pkgs; [
        i3status
        i3lock
        i3blocks
        polybar
      ];
    };
  };
}
