{ inputs, outputs, lib, config, pkgs, ... }:
let
  swww = pkgs.callPackage ../../../../../../pkgs/swww { };
in
{

  home.packages = with pkgs;
    [
      feh
      ffmpeg
      gifsicle
      imagemagick
      pavucontrol
      pulseaudio
      playerctl
      ranger
      swww
      tty-clock
      unzip
      vim
      xfce.thunar
      xfce.xfconf
    ];
}
