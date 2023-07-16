{ ... }:
let autostart = ../xorg-autostart.sh;
in
{
  xsession.windowManager.bspwm = {
    enable = true;
    alwaysResetDesktops = true;
    extraConfig = ''
            ${autostart}
      			
      			bspc monitor -d 󰲡 󰲣 󰲥 󰲧 󰲩 󰲫 󰲭 󰲯 󰲱

      			bspc config border_width         3
      			bspc config window_gap           12

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
