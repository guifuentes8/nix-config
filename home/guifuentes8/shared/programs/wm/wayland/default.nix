{ pkgs, outputs, ... }:
let swww = outputs.packages.${pkgs.system}.swww;
in
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
