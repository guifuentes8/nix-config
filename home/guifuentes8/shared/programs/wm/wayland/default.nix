{ pkgs, outputs, ... }:
let
  wf-recorder2 = outputs.packages.${pkgs.system}.wf-recorder2;
in
{
  imports = [
    ./waybar
  ];

  home.packages = with pkgs; [
    grim
    mako
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
