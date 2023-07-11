{ pkgs, ... }:
let wallpaper = ./background.png;
in
{

  services.xserver = {
    displayManager.lightdm = {
      background = ./background.png;
      enable = true;
      greeters = {
        enso = {
          enable = true;
          blur = true;
        };
      };
    };
  };
}
