{ pkgs, ... }:
let
  xgifwallpaper = pkgs.callPackage ../../../../../../pkgs/xgifwallpaper { };
in
{
  imports = [
    ./picom.nix
    ./polybar.nix
    ./rofi.nix
  ];

  home.packages = with pkgs; [
    discord
    dunst
    flameshot
    lxappearance
    xgifwallpaper
  ];
}
