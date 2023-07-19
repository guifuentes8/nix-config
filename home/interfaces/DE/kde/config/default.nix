{ pkgs, lib, ... }:
{
  imports = [ ./gtk.nix ];

  home.packages = with pkgs; [
    capitaine-cursors
    libsForQt5.qtstyleplugin-kvantum
  ];

}
