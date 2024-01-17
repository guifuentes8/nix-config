{ inputs, outputs, lib, config, pkgs, unstable, ... }: {
  imports = [
    ./alacritty
    ./bottom
    ./cava
    ./dunst
    ./feh
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
    ./taskwarrior
    ./tuifeed
    ./watson
    ./yazi
    ./ytermusic
    ./ytfzf
  ];

  programs = {
    rtorrent.enable = true;
    zathura = {
      enable = true;
      extraConfig = "";
    };
  };

  home.packages = with pkgs; [

    # CLI Apps
    pastel

    # chatgpt
    tgpt

    # presentation slides
    slides

    # Notebook
    nb

    # E-pub reader
    epr

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
    playerctl # mpris

  ];
}
