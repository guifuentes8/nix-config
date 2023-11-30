{ outputs, pkgs, nix-colors, config, ... }:
let
  autostart = ../xorg-autostart.sh;
  my-config = outputs.packages.${pkgs.system}.my-config;
in
{

  xsession.windowManager.bspwm = {
    enable = true;
    alwaysResetDesktops = true;
    startupPrograms = [
      "pkill -USR1 -x sxhkd"
      "sxhkd"
      # "xrandr -s 5120x1440"
      "picom"
      "systemctl --user restart polybar.service"
      "feh --bg-fill ${my-config}/wallpapers/wallpaper.png"
      "pkill dunst"
      "dunst"
      "xsetroot -cursor_name Graphite light Cursors"
    ];
    extraConfig = ''
      bspc monitor -d 󰲡 󰲣 󰲥 󰲧 󰲩 󰲫 󰲭 󰲯 󰲱  
        
      bspc config border_width         2
      bspc config window_gap           10

      bspc config split_ratio          0.50
      bspc config borderless_monocle   true
      bspc config gapless_monocle      true

      bspc config normal_border_color '#${config.colorScheme.colors.base02}'
      bspc config active_border_color '#${config.colorScheme.colors.base02}'
      bspc config focused_border_color '#${config.colorScheme.colors.base0C}'
      bspc config presel_feedback_color '#${config.colorScheme.colors.base0C}'

      bspc config focus_follows_pointer true
      bspc config pointer_follows_focus true
    '';
  };

}




