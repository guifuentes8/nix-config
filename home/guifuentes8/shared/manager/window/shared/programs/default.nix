{ inputs, outputs, lib, config, pkgs, ... }:
let
  spotify-player = outputs.packages.${pkgs.system}.spotify-player;
in
{

  imports = [
    ./bat
    ./bottom
    ./caffeine
    ./cava
    ./gh
    ./git
    ./gpg
    ./himalaya
    ./kitty
    ./mpv
    ./ncspot
    ./neovim
    ./qutebrowser
    ./rofi
    ./spotify-player
    ./sptlrx
    ./tmux
    ./wallpapers
    ./zsh
  ];

  home.packages = with pkgs;
    [
      cava
      cmatrix
      feh
      fortune
      gcalcli
      gifsicle
      imagemagick
      libnotify
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
      xfce.thunar
      xfce.xfconf

      #dev
      nodejs-16_x
      nixpkgs-fmt
      yarn
    ];
}
