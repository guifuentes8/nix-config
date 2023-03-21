{ pkgs, outputs, ... }:
let
  wf-recorder2 = outputs.packages.${pkgs.system}.wf-recorder2;
in
{
  imports = [
    ./foot
    ./mako
    ./waybar
  ];

  home.packages = with pkgs; [
    grim
    slurp
    swaylock
    swayidle
    swww
    webcord
    wl-clipboard
    wf-recorder2
    wtype
  ];

  programs.rofi.package = pkgs.rofi-wayland;

}