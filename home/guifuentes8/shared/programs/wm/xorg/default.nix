{ pkgs, ... }:

{
  imports = [
    ./polybar.nix
    ./rofi.nix
  ];

  home.packages = with pkgs; [
    dunst
    flameshot
    lxappearance
  ];
}
