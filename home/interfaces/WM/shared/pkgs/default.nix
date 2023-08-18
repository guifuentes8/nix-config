{ inputs, outputs, lib, config, pkgs, ... }:
{

  imports = [
    ./alacritty
    ./bottom
    ./cava
    ./eww
    ./himalaya
    ./kitty
    ./matterhorn
    ./mpv
    ./nnn
    ./nchat
    ./ncspot
    ./pass
    ./rofi
    ./sptlrx
    ./spotify-player
    ./tmux
    ./youtube-tui
  ];

  home.packages = with pkgs;
    [
      cmatrix
      feh
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
