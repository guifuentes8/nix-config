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

    discord
    flameshot
    lxappearance
    xdotool
    xclip
    xcolor
  ];
}
