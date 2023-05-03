{ inputs, outputs, lib, config, pkgs, ... }:
let
  spotify-player = outputs.packages.${pkgs.system}.spotify-player;
  slack-term2 = outputs.packages.${pkgs.system}.slack-term2;

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
    ./matterhorn
    ./mpv
    ./nchat
    ./ncspot
    ./neovim
    ./obs
    ./qutebrowser
    ./ranger
    ./rofi
    ./slack-term
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
      matterhorn
      nchat
      pastel
      pavucontrol
      playerctl
      pfetch
      pokemonsay
      pokete
      ranger
      slack-term2
      spotify-player
      sptlrx
      todo
      tty-clock
      tuifeed
      wdisplays
      xfce.thunar
      xfce.xfconf

    ];
}
