{ pkgs, ... }:

{
  xserver.displayManager = {
    lightdm = {
      enable = true;
      background = pkgs.nixos-artwork.wallpapers.nineish.gnomeFilePath;
      greeters = {
        gtk.enable = true;
      };
    };
  };
}
