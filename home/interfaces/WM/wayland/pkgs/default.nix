{ pkgs, outputs, ... }:
{
  imports = [
    ./foot
    ./mako
    ./waybar
  ];

  home.packages = with pkgs; [
    grim
    hyprpicker
    slurp
    swaylock
    swayidle
    swayimg
    swww
    ueberzugpp
    webcord
    wl-clipboard
    wf-recorder
    wtype
  ];

  programs.rofi.package = pkgs.rofi-wayland;

}
