{ pkgs, ... }:
let swww = pkgs.callPackage ../../../../../../../pkgs/swww { };
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
  ];
}
