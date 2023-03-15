{ outputs, pkgs, ... }:
let
  xgifwallpaper = outputs.packages.${pkgs.system}.xgifwallpaper;
in
{
  imports = [
    ./dunst
    ./picom
    ./polybar
    ./screen-lock
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
