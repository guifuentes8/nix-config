{ pkgs, outputs, ... }:
{
  imports = [
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
  ];

  programs.rofi.package = pkgs.rofi-wayland;

}
