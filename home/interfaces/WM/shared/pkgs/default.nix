{ inputs, outputs, lib, config, pkgs, ... }:
{

  imports = [
    ./bottom
    ./cava
    ./feh
    ./himalaya
    ./kitty
    ./nchat
    ./ncspot
    ./qutebrowser
    ./pass
    ./ranger
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
      imagemagick
      libnotify
      pavucontrol
    ];
}
