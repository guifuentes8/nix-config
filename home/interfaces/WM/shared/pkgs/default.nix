{ inputs, outputs, lib, config, pkgs, ... }:
let
  spotify-player = outputs.packages.${pkgs.system}.spotify-player;
  slack-term2 = outputs.packages.${pkgs.system}.slack-term2;

in
{

  imports = [
    ./alacritty
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
    ./nnn
    ./nchat
    ./ncspot
    ./neovim
    ./obs
    ./pass
    ./qutebrowser
    ./rofi
    ./slack-term
    ./spotify-player
    ./sptlrx
    ./tmux
    ./youtube-tui
    ./zsh
  ];

  home.packages = with pkgs;
    [
      cava
      cmatrix
      feh
      gcalcli
      gifsicle
      krabby
      imagemagick
      libnotify
      matterhorn
      nchat
      pastel
      pavucontrol
      playerctl
      pfetch
      slack-term2
      spotify-player
      sptlrx
      todo
      tty-clock
      tuifeed
      xfce.thunar
      xfce.xfconf
    ];
}
