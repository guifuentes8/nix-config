{ pkgs, ... }:
let wallpaper = ./background.jpg;
in
{

  services.xserver = {
    displayManager.lightdm = {
      background = ./background.jpg;
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
