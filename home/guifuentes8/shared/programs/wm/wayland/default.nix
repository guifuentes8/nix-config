{ pkgs, outputs, ... }:
let swww = outputs.packages.${pkgs.system}.swww;
in
{
  imports = [
    ./rofi-wayland.nix
  ];

  home.packages = with pkgs; [
    grim
    mako
    slurp
    swaylock
    swayidle
    swww
    waybar
    webcord
    wl-clipboard
    wf-recorder
    wtype
    wl-copy
  ];
}
