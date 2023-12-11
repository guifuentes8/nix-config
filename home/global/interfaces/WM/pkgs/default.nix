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
    tuifeed

    # Social media
    rainbowstream # twitter

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
