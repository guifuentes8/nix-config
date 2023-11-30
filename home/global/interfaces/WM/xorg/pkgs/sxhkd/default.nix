{ pkgs, outputs, config, ... }:
let
  my-config = outputs.packages.${pkgs.system}.my-config;
  screen-locker = pkgs.writeShellScript "script" ''
    ${pkgs.i3lock-color}/bin/i3lock --image ${my-config}/wallpapers/lock.jpg --beep --nofork --fill --indicator --ignore-empty-password --clock --line-uses-ring --radius=300 --ring-width=18.0 --inside-color=#${config.colorScheme.colors.base01}AA --ring-color=#${config.colorScheme.colors.base0E}FF --insidever-color=#${config.colorScheme.colors.base01}AA --ringver-color=#${config.colorScheme.colors.base0C}FF --insidewrong-color=#${config.colorScheme.colors.base01}AA --ringwrong-color=#${config.colorScheme.colors.base08}FF --keyhl-color=#${config.colorScheme.colors.base0A}FF --bshl-color=#${config.colorScheme.colors.base0C}FF --separator-color=#00000000 --verif-color=#${config.colorScheme.colors.base0C}FF --wrong-color=#${config.colorScheme.colors.base08}FF --modif-color=#${config.colorScheme.colors.base0A}FF --date-color=#${config.colorScheme.colors.base0C}FF --time-color=#${config.colorScheme.colors.base0C}FF --time-str="%H:%M:%S" --date-str="Hoje é %A, dia %d/%m/%Y." --verif-text="Analyzing..." --wrong-text="Password error!" --noinput-text="None!" --lock-text="Locking screen..." --lockfailed-text="Lock failed!"  --time-align=0 --date-align=0 --time-font="JetBrainsMonoNL Nerd Font" --date-font="JetBrainsMonoNL Nerd Font" --verif-font="JetBrainsMonoNL Nerd Font" --wrong-font="JetBrainsMonoNL Nerd Font" --time-size=48 --date-size=24 --verif-size=32 --wrong-size=32 --date-pos="tx:ty+50"
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
      "super + p" = "xcolor | hyprpicker";

    };


  };
}
