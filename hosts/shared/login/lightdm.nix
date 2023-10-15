{ pkgs, lib, ... }:
{
  services.xserver = {
    displayManager = {
      # defaultSession = lib.mkDefault "deepin";
      lightdm = {
        background = ./wallpaper.jpg;
        enable = true;
        greeters = {
          slick = {
            enable = true;
          };
        };
      };
    };
  };
}
