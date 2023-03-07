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
    webcord
    wl-clipboard
    wf-recorder
  ];
}
