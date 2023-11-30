{ unstable, pkgs, outputs, ... }:
{
  imports = [
    ./foot

    ./mpv
    ./mako
    ./waybar
  ];

  home.packages = with unstable; [
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
