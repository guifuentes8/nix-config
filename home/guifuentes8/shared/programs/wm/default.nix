{ inputs, outputs, lib, config, pkgs, ... }:
let
in
{

  home.packages = with pkgs;
    [
      libnotify
      feh
      ffmpeg
      gifsicle
      imagemagick
      pavucontrol
      playerctl
      ranger
      tty-clock
      unzip
      vim
      xfce.thunar
      xfce.xfconf
    ];
}
