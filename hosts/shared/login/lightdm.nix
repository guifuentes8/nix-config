{ pkgs, ... }:
{
  services.xserver = {
    displayManager.lightdm = {
      background = ./wallpaper.jpg;
      enable = true;
      greeters = {
        pantheon = {
          enable = true;
        };
      };
    };
  };
}
