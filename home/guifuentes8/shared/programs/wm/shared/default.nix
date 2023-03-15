{ inputs, outputs, lib, config, pkgs, ... }:
let
  spotify-player = outputs.packages.${pkgs.system}.spotify-player;
in
{

  imports = [
    ./bat
    ./caffeine
    ./gh
    ./git
    ./gpg
    ./himalaya
    ./kitty
    ./ncspot
    ./neovim
    ./qutebrowser
    ./rofi
    ./sxhkd
    ./zsh
  ];

  home.packages = with pkgs;
    [
      bottom
      cava
      cmatrix
      feh
      ffmpeg
      fortune
      gcalcli
      gifsicle
      imagemagick
      libnotify
      mpv
      pavucontrol
      playerctl
      pfetch
      pokemonsay
      pokete
      ranger
      spotify-player
      sptlrx
      todo
      tty-clock
      tuifeed
      unzip
      vim
      xfce.thunar
      xfce.xfconf

      #dev
      nodejs-16_x
      nixpkgs-fmt
      yarn
    ];
}
