{ inputs, outputs, lib, config, pkgs, ... }:
{

  imports = [
    ./gh.nix
    ./git.nix
    ./gpg.nix
    ./himalaya
    ./kitty.nix
    ./ncspot.nix
    ./rofi
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
