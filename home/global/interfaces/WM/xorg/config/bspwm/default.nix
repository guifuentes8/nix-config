{ outputs, pkgs, nix-colors, config, ... }:
let
  my-config = outputs.packages.${pkgs.system}.my-config;
in
{
  xsession.windowManager.bspwm = {
    enable = true;
    alwaysResetDesktops = true;
    startupPrograms = [
      "pkill -USR1 -x sxhkd"
      "sxhkd"
      "picom"
      "systemctl --user restart polybar.service"
      "feh --bg-max ${my-config}/share/wallpapers/wallpaper.png --image-bg '#1e1e2e'"
      "pkill dunst"
      "dunst"
      "xsetroot -cursor_name 'phinger-cursors-light'"
    ];
    extraConfig = ''
      bspc monitor -d 󰲡 󰲣 󰲥 󰲧 󰲩 󰲫 󰲭 󰲯 󰲱  
        
      bspc config border_width         2
      bspc config window_gap           12

      bspc config split_ratio          0.50
      bspc config borderless_monocle   true
      bspc config gapless_monocle      true

      bspc config normal_border_color '#${config.colorScheme.colors.base02}'
      bspc config active_border_color '#${config.colorScheme.colors.base02}'
      bspc config focused_border_color '#${config.colorScheme.colors.base0A}'
      bspc config presel_feedback_color '#${config.colorScheme.colors.base0F}'

      bspc config focus_follows_pointer true
      bspc config pointer_follows_focus true
    '';
  };

}




