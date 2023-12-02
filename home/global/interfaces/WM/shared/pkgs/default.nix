{ inputs, outputs, lib, config, pkgs, unstable, ... }:
let ytermusic = outputs.packages.${pkgs.system}.ytermusic;
in
{

  imports = [
    ./alacritty
    ./bottom
    ./cava
    ./dunst
    ./feh
    ./himalaya
    ./yazi
    ./ncspot
    ./pass
    ./rofi
    ./sptlrx
    ./spotify-player
    ./ytfzf
  ];

  home.packages = [

    # CLI Apps
    pkgs.cmatrix
    pkgs.devour
    pkgs.gcalcli
    pkgs.pastel
    pkgs.playerctl
    pkgs.todo
    pkgs.tty-clock
    pkgs.tuifeed
    ytermusic

    # Dependencies / Others
    pkgs.libnotify
    pkgs.pavucontrol
    pkgs.gnome.nautilus

  ];
}
