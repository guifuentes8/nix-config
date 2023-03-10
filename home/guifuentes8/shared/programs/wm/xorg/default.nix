{ outputs, pkgs, ... }:
let
  xgifwallpaper = outputs.packages.${pkgs.system}.xgifwallpaper;
in
{
  imports = [
    ./dunst.nix
    ./picom.nix
    ./polybar.nix
  ];

  home.packages = with pkgs; [
    betterdiscordctl
    discord
    flameshot
    lxappearance
    xgifwallpaper
    xdotool
    xclip
  ];

  programs.rofi.package = pkgs.rofi;
}
