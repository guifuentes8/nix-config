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
    dunst
    flameshot
    lxappearance
    xgifwallpaper
  ];
}
