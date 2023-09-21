{ pkgs, ... }:
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
