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
    zathura = {
      enable = true;
      extraConfig = ''
              # Huge thanks to u/demusxd for making this config! (i just recolored everything to everforest :P)
        set default-bg                  "#4b565c"
        set default-fg                  "#d3c6aa"

        set statusbar-fg                "#d3c6aa"
        set statusbar-bg                "#2b3339"

        set inputbar-bg                 "#2b3339"
        set inputbar-fg                 "#d3c6aa"

        set notification-bg             "#2b3339"
        set notification-fg             "#d3c6aa"

        set notification-error-bg       "#2b3339"
        set notification-error-fg       "#d3c6aa"

        set notification-warning-bg     "#2b3339"
        set notification-warning-fg     "#d3c6aa"

        set highlight-color             "#4b565c"
        set highlight-active-color      "#e67e80"

        set completion-bg               "#2b3339"
        set completion-fg               "#d3c6aa"

        set completion-highlight-fg     "#4b565c"
        set completion-highlight-bg     "#2b3339"

        set recolor-lightcolor          "#2b3339"
        set recolor-darkcolor           "#d3c6aa"

        set recolor                     "true"
        set recolor-keephue             "false"
      '';
    };
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
    playerctl #mpris

  ];
}
