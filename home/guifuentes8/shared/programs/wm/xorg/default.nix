{ outputs, pkgs, ... }:
let
  xgifwallpaper = outputs.packages.${pkgs.system}.xgifwallpaper;
in
{
  imports = [
    ./dunst.nix
    ./picom.nix
    ./polybar.nix
    ./rofi
  ];

  home.packages = with pkgs; [
    discord
    flameshot
    lxappearance
    xgifwallpaper
    xdotool
    xclip
  ];

  programs.rofi.package = pkgs.rofi;
}
