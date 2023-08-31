{ inputs, outputs, lib, config, pkgs, ... }:
{

  imports = [
    ./bottom
    ./cava
    ./feh
    ./himalaya
    ./joshuto
    ./kitty
    ./matterhorn
    ./mpv
    ./nchat
    ./ncspot
    ./qutebrowser
    ./pass
    ./rofi
    ./sptlrx
    ./spotify-player
    ./ytfzf
  ];

  home.packages = with pkgs;
    [

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
    ];
}
