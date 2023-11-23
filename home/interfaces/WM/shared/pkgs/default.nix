{ inputs, outputs, lib, config, pkgs, unstable, ... }:
let ytermusic = outputs.packages.${pkgs.system}.ytermusic;
in
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

  ];

  home.packages =
    [
      pkgs.gnome.nautilus
      ytermusic

      # CLI Apps
      pkgs.cmatrix
      pkgs.devour
      pkgs.gcalcli
      pkgs.pastel
      pkgs.playerctl
      pkgs.todo
      pkgs.tty-clock
      pkgs.tuifeed

      # Dependencies / Others
      pkgs.libnotify
      pkgs.pavucontrol
    ];
}
