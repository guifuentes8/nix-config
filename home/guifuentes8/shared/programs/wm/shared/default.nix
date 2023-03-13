{ inputs, outputs, lib, config, pkgs, ... }:
let
  spotify-player = outputs.packages.${pkgs.system}.spotify-player;
in
{

  imports = [
    ./bat
    ./gh.nix
    ./git.nix
    ./gpg.nix
    ./himalaya
    ./kitty.nix
    ./ncspot.nix
    ./rofi
    ./sxhkd
    ./zsh.nix
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
