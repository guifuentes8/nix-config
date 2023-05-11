{ pkgs, ... }:
#let wallpaper = ./alone.png;
#in
{
  services.xserver.displayManager.lightdm = {
    #    background = wallpaper;
    enable = true;
    greeters = {
      slick = {
        enable = true;
      };
    };
  };
}
