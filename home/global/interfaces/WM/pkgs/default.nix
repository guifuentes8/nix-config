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
    ./gcalcli
    ./kitty
    ./himalaya
    ./ncmpcpp
    ./ncspot
    ./qutebrowser
    ./pass
    ./ripgrep
    ./rofi
    ./sptlrx
    ./spotify-player
    ./translate-shell
    ./watson
    ./ytfzf
    ./yazi
  ];

  home.packages = [

    # CLI Apps
    pkgs.cmatrix
    pkgs.devour
    pkgs.pastel
    pkgs.playerctl
    pkgs.tty-clock
    pkgs.tuifeed

    # Dependencies / Others
    pkgs.libnotify
    pkgs.pavucontrol

    # Social media
    pkgs.rainbowstream # twitter

    # Music
    ytermusic

    # Networking test
    pkgs.speedtest-rs
    # Notes
    pkgs.nb
    # presentation slides
    pkgs.slides

    # Weather
    pkgs.girouette

    pkgs.yai
    pkgs.nodePackages.webtorrent-cli
  ];
}
