{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ../shared
    ../../programs/wm
    ../../programs/wm/xorg
  ];

  xsession.windowManager.bspwm = {
    enable = true;
    alwaysResetDesktops = true;
    extraConfig = "
			sxhkd &
			systemctl --user restart polybar.service
			${pkgs.feh}/bin/feh --bg-fill ~/.config/wallpapers/images/nixos.png
			bash ~/dotfiles/home/guifuentes8/shared/software-configs/xgifwallpaper/change-wallpaper.sh change
			
			bspc monitor -d I II III IV V VI VII VIII IX X

			bspc config border_width         0
			bspc config window_gap          12

			bspc config split_ratio          0.50
			bspc config borderless_monocle   true
			bspc config gapless_monocle      true

      bspc config normal_border_color 
      bspc config active_border_color 
      bspc config focused_border_color 
      bspc config presel-feedback_colour 

bspc config focus_follows_pointer true
bspc config pointer_follows_focus true
    	";
  };

  services.sxhkd = {
    enable = true;
    keybindings = {

      # Print

      "super + Print" = "flameshot gui";

      # terminal emulator
      "super + Return" = "kitty";

      # program launcher
      "super + d" = "rofi -modes 'drun' -show-icons -show drun";

      # change wallpaper
      "super + w" = "bash ~/dotfiles/home/guifuentes8/shared/software-configs/xgifwallpaper/change-wallpaper.sh change";

      # make sxhkd reload its configuration files:
      "super + Escape" = "pkill -USR1 -x sxhkd";

      #
      # bspwm hotkeys
      #

      # quit/restart bspwm
      "super + alt + {q,r}" = "bspc {quit,wm -r}";

      # close and kill
      "super + {_,shift + }q" = "bspc node -{c,k}";

      # alternate between the tiled and monocle layout
      "super + m" = "bspc desktop -l next";

      # send the newest marked node to the newest preselected node
      "super + y" = "bspc node newest.marked.local -n newest.!automatic.local";

      # swap the current node and the biggest window
      "super + g" = "bspc node -s biggest.window";

      #
      # state/flags
      #

      # set the window state
      "super + {t,shift + t,s,f}" = "bspc node -t {tiled,pseudo_tiled,floating,fullscreen}";

      # set the node flags
      "super + ctrl + {m,x,y,z}" = "bspc node -g {marked,locked,sticky,private}";

      #
      # focus/swap
      #

      # focus the node in the given direction
      "super + {_,shift + }{h,j,k,l}" = "bspc node -{f,s} {west,south,north,east}";

      # focus the node for the given path jump
      "super + {p,b,comma,period}" = "bspc node -f @{parent,brother,first,second}";

      # focus the next/previous window in the current desktop
      "super + {_,shift + }c" = "bspc node -f {next,prev}.local.!hidden.window";

      # focus the next/previous desktop in the current monitor
      "super + bracket{left,right}" = "bspc desktop -f {prev,next}.local";

      # focus the last node/desktop
      "super + {grave,Tab}" = "bspc {node,desktop} -f last";

      # focus the older or newer node in the focus history
      "super + {o,i}" = "bspc wm -h off; \
			bspc node {older,newer} -f; \
			bspc wm -h on";

      # focus or send to the given desktop
      "super + {_,shift + }{1-9,0}" = "bspc {desktop -f,node -d} '^{1-9,10}'";

      #
      # preselect
      #

      # preselect the direction
      "super + ctrl + {h,j,k,l}" = "bspc node -p {west,south,north,east}";

      # preselect the ratio
      "super + ctrl + {1-9}" = "bspc node -o 0.{1-9}";

      # cancel the preselection for the focused node
      "super + ctrl + space" = "bspc node -p cancel";

      # cancel the preselection for the focused desktop
      "super + ctrl + shift + space" = "bspc query -N -d | xargs -I id -n 1 bspc node id -p cancel";

      #
      # move/resize
      #

      # expand a window by moving one of its side outward
      "super + alt + {h,j,k,l}" = "bspc node -z {left -20 0,bottom 0 20,top 0 -20,right 20 0}";

      # contract a window by moving one of its side inward
      "super + alt + shift + {h,j,k,l}" = "bspc node -z {right -20 0,top 0 20,bottom 0 -20,left 20 0}";

      # move a floating window
      "super + {Left,Down,Up,Right}" = "bspc node -v {-20 0,0 20,0 -20,20 0}";
    };

  };
}