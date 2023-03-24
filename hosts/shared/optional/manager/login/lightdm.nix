{ pkgs, ... }:
let wallpaper = ./asus.jpg;
in
{
  services.xserver.displayManager.lightdm = {
    background = wallpaper;
    enable = true;
    greeters = {
      enso = {
        enable = true;
        blur = true;
      };
    };
  };
}
