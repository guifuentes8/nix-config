{ unstable, pkgs, outputs, ... }: {
  imports = [ ./foot ./mpv ./screen-lock ./waybar ./wpaperd ];

  home.packages = with unstable; [
    grim
    hyprpicker
    nwg-look
    slurp
    swaylock-effects
    swayidle
    swayimg
    wdisplays

    wl-clipboard
    wf-recorder
    wtype
    webcord
  ];

  programs.rofi.package = pkgs.rofi-wayland;

}
