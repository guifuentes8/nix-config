{ ... }:
let autostart = ../../config/autostart.sh;
in
{
  imports = [

    # Xorg packages
    ../../pkgs

    # Shared window manager folder (pkgs and xdg)
    ../../../shared
  ];

  xsession.windowManager.bspwm = {
    enable = true;
    alwaysResetDesktops = true;
    extraConfig = "

            ${autostart}
      			
      			bspc monitor -d      

      			bspc config border_width         0
      			bspc config window_gap          12

      			bspc config split_ratio          0.50
      			bspc config borderless_monocle   true
      			bspc config gapless_monocle      true



            bspc config normal_border_color '#6e6f70'
            bspc config active_border_color '#6e6f70'
            bspc config focused_border_color '#52bdff'
            bspc config presel-feedback_colour '#ee5396'

            bspc config focus_follows_pointer true
            bspc config pointer_follows_focus true
    	";
  };

}
