{ outputs, pkgs, ... }:
let
in {
  imports = [ ./mpv ./picom ./polybar ./screen-lock ./sxhkd ../../wm ];

  services = { flameshot.enable = true; };

  home.packages = with pkgs; [ discord flameshot lxappearance xclip xcolor ];
}
