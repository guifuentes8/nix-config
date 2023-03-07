{ pkgs, ... }:

{
  imports = [
    ./rofi-wayland.nix
  ];

  home.packages = with pkgs; [
    dunst
    flameshot
    lxappearance
    polybar
  ];
}
