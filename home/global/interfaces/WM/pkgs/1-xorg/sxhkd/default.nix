{ pkgs, outputs, config, ... }:
let
  BLANK = "#${config.colorScheme.colors.base00}00";
  CLEAR = "#${config.colorScheme.colors.base01}22";
  DEFAULT = "#${config.colorScheme.colors.base0B}cc";
  TEXT = "#${config.colorScheme.colors.base06}ee";
  WRONG = "#${config.colorScheme.colors.base08}bb";
  INPUT = "#${config.colorScheme.colors.base0D}ee";
  VERIFYING = "#${config.colorScheme.colors.base0A}bb";
  my-config = outputs.packages.${pkgs.system}.my-config;
  screen-locker = pkgs.writeShellScript "script" ''
    ${pkgs.i3lock-color}/bin/i3lock  --beep --nofork --screen 1 --blur 5 --indicator --ignore-empty-password --clock --line-uses-ring --radius=300 --ring-width=18.0 --line-color=${BLANK} --inside-color=${BLANK} --ring-color=${DEFAULT} --insidever-color=${CLEAR} --ringver-color=${VERIFYING} --insidewrong-color=${CLEAR} --ringwrong-color=${WRONG} --keyhl-color=${INPUT} --bshl-color=${WRONG} --separator-color=${DEFAULT} --verif-color=${TEXT} --wrong-color=${TEXT} --modif-color=${TEXT} --date-color=${TEXT} --time-color=${TEXT} --time-str="%H:%M:%S" --date-str="Hoje é %A, dia %d/%m/%Y." --verif-text="Analyzing..." --wrong-text="Password error!" --noinput-text="None!" --lock-text="Locking screen..." --lockfailed-text="Lock failed!"  --time-align=0 --date-align=0 --time-font="Dank Mono:style=Italic" --date-font="Dank Mono:style=Italic" --verif-font="Dank Mono:style=Italic" --wrong-font="Dank Mono:style=Italic" --time-size=48 --date-size=32 --verif-size=32 --wrong-size=32 --date-pos="tx:ty+50"
  '';
in
{
  services.sxhkd = {
    enable = true;
    keybindings = {

      # KEYBINDINGS -----------------------------------

      # Print
      "Print" = "flameshot gui";

      # terminal emulator
      "super + Return" = "alacritty";

      # program launcher
      "super + @space" = "rofi -modes 'drun' -show-icons -show drun";

      # reload sxhkd 
      "super + BackSpace" = "pkill -USR1 -x sxhkd && notify-send sxhkd reloaded!";


      # BSPWM KEYBINDS ------------------------------------------------

      # quit bspwm
      "super + Escape" = "bspc quit";
      "super + ctrl + Escape" = "${screen-locker}";

      # restart bspwm
      "super + alt + r" = "bspc wm -r";

      # close or kill windows
      "super + {_,shift + }q" = "bspc node -{c,k}";

      # set the window state
      "super + t" = "bspc node -t tiled";
      "super + shift + t" = "bspc node -t pseudo_tiled";
      "super + f" = "bspc node -t floating";
      "super + m" = "bspc node -t fullscreen";

      # set focus on the node
      "super + shift + {Left,Down,Up,Right}" = "bspc node -s {west,south,north,east}";
      "super + {Left,Down,Up,Right}" = "bspc node -f {west,south,north,east}";

      # set focus the last node/workspace
      "super + {grave,Tab}" = "bspc {node,desktop} -f last";

      # set focus or send to the given workspace
      "super + {_,shift + }{1-9,0}" = "bspc {desktop -f,node -d} '^{1-9,10}'";

      # preselect the direction
      "super + ctrl + {Left,Down,Up,Right}" = "bspc node -p {west,south,north,east}";

      # preselect the ratio
      "super + ctrl + {1-9}" = "bspc node -o 0.{1-9}";

      # cancel the preselection for the focused node
      "super + ctrl + space" = "bspc node -p cancel";

      # cancel the preselection for the focused desktop
      "super + ctrl + shift + space" = "bspc query -N -d | xargs -I id -n 1 bspc node id -p cancel";

      # expand a window by moving one of its side outward
      "super + alt + {Left,Down,Up,Right}" = "bspc node -z {left -20 0,bottom 0 20,top 0 -20,right 20 0}";

      # contract a window by moving one of its side inward
      "super + alt + shift + {Left,Down,Up,Right}" = "bspc node -z {right -20 0,top 0 20,bottom 0 -20,left 20 0}";

      # move a floating window
      "super + {h,j,k,l}" = "bspc node -v {-20 0,0 20,0 -20,20 0}";


      # ROFI

      # Bluetooth
      "super + F1" = "rofi-bluetooth";
      # Input Device Audio
      "super + F2" = "rofi-pulse-select source";
      # Output Device Audio
      "super + F3" = "rofi-pulse-select sink";
      # Bitwarden
      "super + F4" = "rofi-rbw";
      # Filebrowser
      "super + F5" = "rofi -modes 'file-browser-extended' -show file-browser-extended";
      # Calc
      "super + F8" = "rofi -show calc -modi calc -no-show-match -no-sort -kb-accept-entry 'Control+c' -calc-command ' echo - n '{ result }' | xclip -sel copy'";

      "super + F9" = "ytfzf -D -d";

      "super + F10" = "ytfzf -D";
      # Emoji
      "super + F11" = "rofi -modi emoji -show emoji";
      # Power Menu
      "super + F12" = "rofi -show p -modi p:rofi-power-menu -lines 6";



      # MEDIA / VOLUME

      # Increase volume
      "XF86AudioRaiseVolume" = "pactl set-sink-volume @DEFAULT_SINK@ +1000";
      # Decrease volume
      "XF86AudioLowerVolume" = "pactl set-sink-volume @DEFAULT_SINK@ -1000";
      # Mute volume
      "XF86AudioMute" = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
      # Mute microphone
      "XF86AudioMicMute" = "pactl set-source-mute @DEFAULT_SOURCE@ toggle";
      # Brightness
      "XF86MonBrightnessDown" = "brightnessctl set 5%-";
      "XF86MonBrightnessUp" = "brightnessctl set 5%+";
      # Media player
      "XF86AudioPlay" = "playerctl play-pause";
      "XF86AudioNext" = "playerctl next";
      "XF86AudioPrev" = "playerctl previous";


      # OTHERS PROGRAMS
      "super + p" = "xcolor -s clipboard";

    };


  };
}