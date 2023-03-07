{ pkgs, outputs, ... }:
let
  swww = outputs.packages.${pkgs.system}.swww;
in
{

  home.packages = with pkgs; [
    feh
    pavucontrol
    playerctl
    ranger
    swww
    tty-clock
    vim
    xfce.thunar
    xfce.xfconf
  ];
}
