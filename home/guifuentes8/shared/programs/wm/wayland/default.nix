{ pkgs, ... }:

{
  imports = [
    ./rofi-wayland.nix
  ];

  home.packages = with pkgs; [
    grim
    mako
    swaylock
    swayidle
    slurp
    waybar
    webcord
    wl-clipboard
    wf-recorder
  ];
}
