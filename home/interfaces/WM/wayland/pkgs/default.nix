{ pkgs, outputs, ... }:
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
    wf-recorder
    wtype
  ];

  programs.rofi.package = pkgs.rofi-wayland;

}
