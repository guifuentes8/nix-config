{ unstable, pkgs, outputs, ... }:
{
  imports = [
    ./foot
    ./mpv
    ./screen-lock
    ./waybar
    ./wpaperd
  ];

  home.packages = with unstable; [
    libva-utils
    vdpauinfo
    vlc

    grim
    hyprpicker
    nwg-look
    slurp
    swaylock-effects
    swayidle
    swayimg
    wl-clipboard
    wf-recorder
    wtype
    webcord
  ];

  programs.rofi.package = pkgs.rofi-wayland;

}
