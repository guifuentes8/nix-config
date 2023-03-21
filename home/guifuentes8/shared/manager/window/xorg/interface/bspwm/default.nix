{ inputs, outputs, lib, config, pkgs, ... }:
let autostart = ../../programs/autostart/autostart.sh;
in
{
  imports = [
    ../../programs
    ../../../shared/programs
  ];

  xsession.windowManager.bspwm = {
    enable = true;
    alwaysResetDesktops = true;
    extraConfig = "

            ${autostart}
      			
      			bspc monitor -d 1 2 3 4 5 6 7 8 9 10

      			bspc config border_width         3
      			bspc config window_gap          12

      			bspc config split_ratio          0.50
      			bspc config borderless_monocle   true
      			bspc config gapless_monocle      true

            bspc config normal_border_color '#8aadf4'
            bspc config active_border_color '#8aadf4'
            bspc config focused_border_color '#a6da95'
            bspc config presel-feedback_colour '#f5a97f'

            bspc config focus_follows_pointer true
            bspc config pointer_follows_focus true
    	";
  };

}
