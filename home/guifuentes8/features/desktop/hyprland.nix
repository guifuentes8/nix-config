{ inputs, config, pkgs, unstable, configOptions, ... }:
let cw = ./theme/wallpapers/cw.sh;
in {

  imports = [ ./common/wm/wayland ./theme ];

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      # ON START
        exec-once = swww-daemon 
        exec-once = wl-clipboard-history -t
        exec-once = dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
        exec-once = systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
        exec-once = hyprctl setcursor ${configOptions.styles.cursor.name} ${configOptions.styles.cursor.size} 
        exec-once = gsettings set org.gnome.desktop.interface gtk-theme ${configOptions.styles.gtk.name}
        exec-once = gsettings set org.gnome.desktop.interface cursor-theme ${configOptions.styles.cursor.name}
        exec-once = gsettings set org.gnome.desktop.interface cursor-size ${configOptions.styles.cursor.size} 

      # MONITORS
       monitor=,preferred,auto,1

      # VARIABLES
        general {
            gaps_in = 8
            gaps_out = 10
            border_size = ${configOptions.styles.wm.borderWidth} 
            col.active_border = rgb(${config.colorScheme.palette.base0B})
            col.inactive_border = rgb(${config.colorScheme.palette.base0D})
            no_border_on_floating = false
            layout = dwindle
        }

        decoration {
            blur {
              enabled = true
              size = 8
              passes = 2
              new_optimizations = true
              ignore_opacity = false
              xray = false
            }
            rounding = ${configOptions.styles.wm.borderRadius}
            drop_shadow = true
            shadow_range = 4
            shadow_render_power = 3
            shadow_ignore_window = true
            col.shadow = 0xee000000
          #  shadow_offset = [2, 2]
            active_opacity = 1
            inactive_opacity = 1
            fullscreen_opacity = 1
        }

        animations {
            enabled = true
            bezier = myBezier, 0.05, 0.9, 0.1, 1.05
            animation = windows, 1, 7, myBezier
            animation = windowsOut, 1, 7, default, popin 80%
            animation = border, 1, 10, default
            animation = borderangle, 1, 8, default
            animation = fade, 1, 7, default
            animation = workspaces, 1, 10, default
        }

        input {
            kb_layout = ${configOptions.styles.keyboard.layout}
            kb_variant = ${configOptions.styles.keyboard.variant}
            numlock_by_default = true
            follow_mouse = 1
            touchpad {
                natural_scroll = false
                disable_while_typing = true
            }
            sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
        }

        gestures {
            workspace_swipe = true
            workspace_swipe_numbered = true
            workspace_swipe_cancel_ratio = 0.5
            workspace_swipe_min_speed_to_force = 0
        }

        dwindle {
            pseudotile = true # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
            preserve_split = true # you probably want this
        }

        master {
            new_is_master = true
        }

        device:at-translated-set-2-keyboard {
         kb_layout = ${configOptions.styles.keyboard.layout}
        }

        misc {
          disable_hyprland_logo	= false
          force_hypr_chan = false
        }

      # KEYBINDS

        $mainMod = SUPER
      #  $term = footclient
        $term = kitty

        bind = $mainMod, Return, exec, $term
        bind = $mainMod, Escape, exit,
        bind = CTRL_ALT, Escape, exec, swaylock --screenshots --clock --indicator --indicator-radius 100 --indicator-thickness 7 --effect-blur 7x5 --effect-vignette 0.5:0.5 --ring-color 7aa2f7cc --ring-clear-color 32344a --ring-ver-color e0af68 --ring-wrong-color f7768e --key-hl-color 73dacaee --bs-hl-color f7768e --line-color 00000000 --line-clear 00000000 --line-ver-color 00000000 --line-wrong-color 00000000 --inside-color 00000000 --inside-clear-color 32344a --inside-ver-color 00000000 --inside-wrong-color 00000000 --separator-color 7aa2f7cc --text-color c0caf6 --text-clear-color c0caf6 --text-ver-color c0caf6 --text-wrong-color c0caf6 --grace 2 --fade-in 0.2
        bind = $mainMod, Space, exec, rofi -modes "drun" -show-icons -show drun
        bind = $mainMod, Q, killactive,
        bind = $mainMod, S, togglesplit, # dwindle
        bind = $mainMod, F, togglefloating,
        bind = $mainMod, M, fullscreen, 1

      # Move focus with mainMod + arrow keys
        bind = $mainMod, left, movefocus, l
        bind = $mainMod, right, movefocus, r
        bind = $mainMod, up, movefocus, u
        bind = $mainMod, down, movefocus, d

        # Switch workspaces with mainMod + [0-9]
        bind = $mainMod, 1, workspace, 1
        bind = $mainMod, 2, workspace, 2
        bind = $mainMod, 3, workspace, 3
        bind = $mainMod, 4, workspace, 4
        bind = $mainMod, 5, workspace, 5
        bind = $mainMod, 6, workspace, 6
        bind = $mainMod, 7, workspace, 7
        bind = $mainMod, 8, workspace, 8
        bind = $mainMod, 9, workspace, 9
        bind = $mainMod, 0, workspace, 10
        bind = $mainMod SHIFT, 1, movetoworkspace, 1
        bind = $mainMod SHIFT, 2, movetoworkspace, 2
        bind = $mainMod SHIFT, 3, movetoworkspace, 3
        bind = $mainMod SHIFT, 4, movetoworkspace, 4
        bind = $mainMod SHIFT, 5, movetoworkspace, 5
        bind = $mainMod SHIFT, 6, movetoworkspace, 6
        bind = $mainMod SHIFT, 7, movetoworkspace, 7
        bind = $mainMod SHIFT, 8, movetoworkspace, 8
        bind = $mainMod SHIFT, 9, movetoworkspace, 9
        bind = $mainMod SHIFT, 0, movetoworkspace, 10

      # Scroll through existing workspaces with mainMod + scroll
        bind = $mainMod, mouse_down, workspace, e+1
        bind = $mainMod, mouse_up, workspace, e-1

        # Move/resize windows with mainMod + LMB/RMB and dragging
        bindm = $mainMod, mouse:272, movewindow
        bindm = $mainMod, mouse:273, resizewindow

        bind=ALT,R,submap,resize
        submap=resize

        # sets repeatable binds for resizing the active window
        binde=,right,resizeactive,10 0
        binde=,left,resizeactive,-10 0
        binde=,up,resizeactive,0 -10
        binde=,down,resizeactive,0 10

        # use reset to go back to the global submap
        bind=,escape,submap,reset 

        # will reset the submap, meaning end the current one and return to the global one
        submap=reset

        # Light screen
        bind = ,XF86MonBrightnessUp, exec, xbacklight -inc 10
        bind = ,XF86MonBrightnessDown, exec, xbacklight -dec 10
              
        # Volume
        bind = ,XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +5%
        bind = ,XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -5%
        bind = ,XF86AudioMute, exec, pactl set-sink-mute @DEFAULT_SINK@ toggle
        bind = ,XF86AudioMicMute, exec, pactl set-source-mute @DEFAULT_SOURCE@ toggle
              
        # Mpris
        bind = ,XF86AudioPrev, exec, playerctl previous
        bind = ,XF86AudioPlay, exec, playerctl play-pause
        bind = ,XF86AudioNext, exec, playerctl next

        # Printscreen
        bind = ,Print, exec, grim -g "$(slurp)" - | wl-copy 
              
        # Rofi scripts
        bind = $mainMod, F1, exec, rofi -show calc -modi calc -no-show-match -no-sort
        bind = $mainMod, F2, exec, rofi -modi emoji -show emoji
        bind = $mainMod, F3, exec, 
        bind = $mainMod, F4, exec, 
        bind = $mainMod, F5, exec,
        bind = $mainMod, F6, exec, 
        bind = $mainMod, F7, exec, 
        bind = $mainMod, F8, exec, rofi-systemd 
        bind = $mainMod, F9, exec, rofi-pulse-select sink
        bind = $mainMod, F10, exec, rofi-bluetooth 
        bind = $mainMod, F11, exec, rofi-rbw --keybindings 'Alt+u:copy:username,Alt+p:copy:password,Alt+t:copy:totp,Alt+n:copy:notes'        
        bind = $mainMod, F12, exec, rofi -show p -modi p:rofi-power-menu -lines 6

        # Pick color
        bind = $mainMod SHIFT, p, exec, ${unstable.hyprpicker}/bin/hyprpicker -a
        bind = $mainMod SHIFT, b, exec, qutebrowser;
        bind = $mainMod SHIFT, m, exec, kitty -e spotify_player;
        bind = $mainMod SHIFT, e, exec, kitty -e nvim;
        bind = $mainMod SHIFT, f, exec, kitty -e yazi;
        bind = $mainMod, W, exec, bash ${cw} change


        bind = ALT,Space, exec, hyprctl switchxkblayout at-translated-set-2-keyboard next
        bind = ALT,Space, exec, hyprctl switchxkblayout logitech-usb-receiver next


        windowrule = float,^(mpv)$
        windowrule = size 960 520,^(mpv)$
        windowrule = center,^(mpv)$
    '';
  };
}
