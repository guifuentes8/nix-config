{ pkgs, outputs, ... }:
let
  wf-recorder2 = outputs.packages.${pkgs.system}.wf-recorder2;
in
{
  imports = [
    ./foot
    ./mako
    ./waybar
    ./hyprpaper
  ];

  home.packages = with pkgs; [
    grim
    hyprpicker
    hyprpaper
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
