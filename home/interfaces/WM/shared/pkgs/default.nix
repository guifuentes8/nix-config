{ inputs, outputs, lib, config, pkgs, ... }:
{

  imports = [
    ./bottom
    ./cava
    ./feh
    ./himalaya
    ./kitty
    ./yazi
    ./nchat
    ./ncspot
    ./qutebrowser
    ./pass
    ./rofi
    ./sptlrx
    ./spotify-player
    ./ytfzf
    ./ytermusic

  ];

  home.packages = with pkgs;
    [

      gnome.nautilus

      # CLI Apps
      cmatrix
      devour
      gcalcli
      pastel
      playerctl
      todo
      tty-clock
      tuifeed

      # Dependencies / Others
      libnotify
      pavucontrol
    ];
}
