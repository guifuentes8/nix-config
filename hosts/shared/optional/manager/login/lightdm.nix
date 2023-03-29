{ pkgs, ... }:
let wallpaper = ./nixos.png;
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
