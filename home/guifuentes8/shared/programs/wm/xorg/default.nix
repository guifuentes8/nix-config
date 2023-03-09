{ pkgs, ... }:
let
  xgifwallpaper = pkgs.callPackage ../../../../../../pkgs/xgifwallpaper { };
in
{
  imports = [
    ./dunst.nix
    ./picom.nix
    ./polybar.nix
    ./rofi.nix
  ];

  home.packages = with pkgs; [
    discord
    flameshot
    lxappearance
    xgifwallpaper
  ];
}
