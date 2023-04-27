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
    ./eww
    ./gh
    ./git
    ./gpg
    ./himalaya
    ./kitty
    ./mpv
    ./ncspot
    ./neovim
    ./obs
    ./qutebrowser
    ./rofi
    ./spotify-player
    ./sptlrx
    ./tmux
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
      pastel
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
      wdisplays
      xfce.thunar
      xfce.xfconf

      #dev
      nodejs-16_x
      nixpkgs-fmt
      yarn
    ];
}
