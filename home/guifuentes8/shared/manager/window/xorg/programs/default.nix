{ outputs, pkgs, ... }:
let
  xgifwallpaper = outputs.packages.${pkgs.system}.xgifwallpaper;
in
{
  imports = [
    ./dunst
    ./i3
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
    smart-wallpaper
    xgifwallpaper
    xdotool
    xclip
  ];

  programs.rofi.package = pkgs.rofi;
}
