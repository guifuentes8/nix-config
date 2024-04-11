{ unstable, pkgs, outputs, ... }: {
  imports = [ ../../wm ./foot ./mpv ./screen-lock ./waybar ./wpaperd ];

  home.packages = with unstable; [
    grim
    hyprpicker
    nwg-look
    slurp
    swaylock-effects
    swayidle
    swayimg
    wdisplays
    swww
    wl-clipboard
    wf-recorder
    wtype
    webcord
  ];

  programs.rofi.package = pkgs.rofi-wayland;

}
