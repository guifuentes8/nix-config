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

      			bspc config border_width         0
      			bspc config window_gap          12

      			bspc config split_ratio          0.50
      			bspc config borderless_monocle   true
      			bspc config gapless_monocle      true



            bspc config normal_border_color '#CBA6F7'
            bspc config active_border_color '#CBA6F7'
            bspc config focused_border_color '#f5a97f'
            bspc config presel-feedback_colour '#F9E2AF'

            bspc config focus_follows_pointer true
            bspc config pointer_follows_focus true
    	";
  };

}
