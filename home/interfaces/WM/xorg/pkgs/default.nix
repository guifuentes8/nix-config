{ outputs, pkgs, ... }:
let
in
{
  imports = [
    ./dunst

    ./mpv
    ./picom
    ./polybar
    ./screen-lock
    ./sxhkd
  ];

  home.packages = with pkgs; [
    betterdiscordctl
    flameshot
    lxappearance
    xdotool
    xclip
    xcolor
  ];

  programs.rofi.package = pkgs.rofi;
}
