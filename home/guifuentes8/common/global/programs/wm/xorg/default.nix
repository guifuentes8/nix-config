{ pkgs, ... }:

{
  imports = [
    ./rofi.nix
  ];

  home.packages = with pkgs; [
    dunst
    flameshot
    lxappearance
    polybar
  ];
}
