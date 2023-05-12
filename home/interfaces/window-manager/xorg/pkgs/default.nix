{ outputs, pkgs, ... }:
let
in
{
  imports = [
    ./dunst
    ./picom
    ./polybar
    ./screen-lock
    ./sxhkd
  ];

  home.packages = with pkgs; [
    betterdiscordctl
    discord
    flameshot
    lxappearance
    xdotool
    xclip
  ];

  programs.rofi.package = pkgs.rofi;
}
