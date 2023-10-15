{ pkgs, outputs, ... }:
{
  imports = [
    ./foot
    ./firefox
    ./mpv
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
    wl-clipboard
    wf-recorder
    wtype
    webcord
  ];

  programs.rofi.package = pkgs.rofi-wayland;

}
