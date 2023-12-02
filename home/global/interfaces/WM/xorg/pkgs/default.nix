{ outputs, pkgs, ... }:
let
in
{
  imports = [
    ./mpv
    ./picom
    ./polybar
    ./screen-lock
    ./sxhkd
  ];

  home.packages = with pkgs; [
    flameshot
    lxappearance
    xdotool
    xclip
    xcolor
  ];
}
