{ inputs, outputs, lib, config, pkgs, unstable, ... }:
let ytermusic = outputs.packages.${pkgs.system}.ytermusic;
in
{

  imports = [
    ./alacritty
    ./bottom
    ./cava
    ./dstask
    ./dunst
    ./feh
    ./gcalcli
    ./kitty
    ./himalaya
    ./ncmpcpp
    ./ncspot
    ./qutebrowser
    ./pass
    ./ripgrep
    ./rtorrent
    ./rofi
    ./sptlrx
    ./spotify-player
    ./translate-shell
    ./watson
    ./ytfzf
    ./yazi
    ./zathura
    ./zoxide
  ];

  home.packages = [

    # CLI Apps
    pkgs.cmatrix
    pkgs.devour
    pkgs.pastel
    pkgs.playerctl
    pkgs.tty-clock
    pkgs.tuifeed
    ytermusic

    # Dependencies / Others
    pkgs.libnotify
    pkgs.pavucontrol

  ];
}
