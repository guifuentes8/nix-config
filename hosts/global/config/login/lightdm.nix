{ pkgs, ... }:
let wallpaper = ./alone.png;
in
{

  services.xserver = {
    displayManager.lightdm = {
      background = ./alone.png;
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
