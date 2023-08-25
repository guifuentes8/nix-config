{ inputs, outputs, lib, config, pkgs, ... }:
{

  imports = [
    ./alacritty
    ./bottom
    ./cava
    ./eww
    ./feh
    ./himalaya
    ./joshuto
    ./kitty
    ./matterhorn
    ./mpv
    ./nchat
    ./ncspot
    ./pass
    ./rofi
    ./sptlrx
    ./spotify-player
    ./tmux
    ./ytfzf
  ];

  home.packages = with pkgs;
    [
      cmatrix
      devour
      gcalcli
      gifsicle
      imagemagick
      libnotify
      matterhorn
      nchat
      pastel
      pavucontrol
      playerctl
      pfetch
      slack-term
      spotify-player
      sptlrx
      todo
      tty-clock
      tuifeed
      xfce.thunar
      xfce.thunar-volman
      xfce.thunar-archive-plugin
      xfce.thunar-media-tags-plugin
      xfce.xfconf
    ];
}
