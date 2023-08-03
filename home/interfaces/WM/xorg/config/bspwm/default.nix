{ pkgs, ... }:
let autostart = ../xorg-autostart.sh;
in
{
  xsession.windowManager.bspwm = {
    enable = true;
    alwaysResetDesktops = true;
    startupPrograms = [
      "picom"
      "systemctl --user restart polybar.service"
      "xrandr -s 5120x1440"
      "feh --bg-scale --randomize ~/.config/wallpapers/images/5120x1440/w1-5120.png"
      "pkill dunst"
      "dunst"
      "xsetroot -cursor_name left_ptr"
    ];
    extraConfig = ''
      			bspc monitor -d 󰲡 󰲣 󰲥 󰲧 󰲩 󰲫 󰲭 󰲯 󰲱

      			bspc config border_width         2
      			bspc config window_gap           8

      			bspc config split_ratio          0.50
      			bspc config borderless_monocle   true
      			bspc config gapless_monocle      true

            bspc config normal_border_color '#9aa5ce'
            bspc config active_border_color '#9aa5ce'
            bspc config focused_border_color '#2ac3de'
            bspc config presel-feedback_colour '#f7768e'

            bspc config focus_follows_pointer true
            bspc config pointer_follows_focus true

    '';
  };

}




