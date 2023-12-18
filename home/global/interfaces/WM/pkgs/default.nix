{ inputs, outputs, lib, config, pkgs, unstable, ... }:
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
    ./tuifeed
    ./watson
    ./yazi
    ./ytermusic
    ./ytfzf
  ];

  programs = {
    rtorrent.enable = true;
  };

  home.packages = with pkgs; [

    # CLI Apps
    pastel

    # chatgpt
    tgpt

    # Google drive
    gdrive3

    # Notes
    nb

    # presentation slides
    slides

    # Weather
    girouette

    # Networking test
    speedtest-rs

    # 4fun
    cmatrix
    devour
    tty-clock

    # Dependencies / Others
    libnotify

    # Sound
    pavucontrol
    playerctl #mpris

  ];
}
