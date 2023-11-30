{ inputs, config, pkgs, ... }: {
  imports = [
    inputs.hyprland.homeManagerModules.default
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.default;
    extraConfig = ''
      # ON START
        exec-once = mako
        exec-once = wl-clipboard-history -t
        exec-once = dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
        exec-once = systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
        exec-once = gsettings set org.gnome.desktop.interface gtk-theme Lavanda-Dark
        exec-once = gsettings set org.gnome.desktop.interface cursor-theme phinger-cursors-light
        exec-once = gsettings set org.gnome.desktop.interface cursor-size 32
        exec-once = hyprctl setcursor phinger-cursors-light 32
        exec-once = bash /home/guifuentes8/nix-config/home/shared/wallpapers/swww/change-wallpaper.sh init
        exec-once = bash /home/guifuentes8/nix-config/home/shared/wallpapers/swww/change-wallpaper.sh change
  
      # MONITORS

        monitor=,preferred,auto,1

      # VARIABLES

        input {
            kb_layout = br
            kb_variant = abnt2
            kb_model =
            kb_options =
            kb_rules =
            numlock_by_default = true
            follow_mouse = 1
            touchpad {
                natural_scroll = false
            }
            sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
        }

        general {
            gaps_in = 4
            gaps_out = 8
            border_size = 3
            col.active_border = rgb(${config.colorScheme.colors.base0C})
            col.inactive_border = rgb(${config.colorScheme.colors.base06})
            no_border_on_floating = true
            layout = dwindle
        }

        decoration {
            blur {
              enabled = true
              size = 8
              passes = 1
              new_optimizations = true
              ignore_opacity = true
              xray = true
            }
            rounding = 4
            drop_shadow = true
            shadow_range = 12
            shadow_render_power = 3
            shadow_ignore_window	= true
            col.shadow = rgb(${config.colorScheme.colors.base00})
            shadow_offset = [2, 4]
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
            #animation = workspaces, 1, 10, default
        }

        dwindle {
            pseudotile = true # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
            preserve_split = true # you probably want this
        }

        master {
            new_is_master = true
        }

        gestures {
            workspace_swipe = true
            workspace_swipe_numbered = true
            workspace_swipe_cancel_ratio = 0.5
            workspace_swipe_min_speed_to_force = 0
        }

        device:epic-mouse-v1 {
          sensitivity = -0.5
        }

      # KEYBINDS

        $mainMod = SUPER
        $term = footclient | foot

        bind = $mainMod, Escape, exit,
        bind = $mainMod, Return, exec, $term
        bind = $mainMod, Space, exec, rofi -modes "drun" -show-icons -show drun
        bind = $mainMod, Q, killactive,
        bind = $mainMod, W, exec, bash /home/guifuentes8/nix-config/home/shared/wallpapers/swww/change-wallpaper.sh change
        bind = $mainMod, S, togglesplit, # dwindle
        bind = $mainMod, F, togglefloating,
        bind = $mainMod, M, fullscreen, 1
        bind = $mainMod, P, pseudo, # dwindle

        bind = $mainMod, F1, exec, rofi-bluetooth
        bind = $mainMod, F2, exec, rofi-pulse-select source
        bind = $mainMod, F3, exec, rofi-pulse-select sink
        bind = $mainMod, F4, exec, rofi-rbw
        bind = $mainMod, F5, exec, rofi -modes 'file-browser-extended' -show file-browser-extended
        bind = $mainMod, F6, exec, 
        bind = $mainMod, F7, exec, 
        bind = $mainMod, F8, exec, rofi -show calc -modi calc -no-show-match -no-sort -kb-accept-entry 'Control+c' -calc-command ' echo - n '{ result }' | wl-copy -sel copy'
        bind = $mainMod, F9, exec, ytfzf -D -d
        bind = $mainMod, F10, exec, ytfzf -D
        bind = $mainMod, F11, exec, rofi -modi emoji -show emoji
        bind = $mainMod, F12, exec, rofi -show p -modi p:rofi-power-menu -lines 6

        bind = ,XF86MonBrightnessUp, exec, xbacklight -inc 10
        bind = ,XF86MonBrightnessDown, exec, xbacklight -dec 10
        bind = ,XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +5%
        bind = ,XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -5%
        bind = ,XF86AudioMute, exec, pactl set-sink-mute @DEFAULT_SINK@ toggle
        bind = ,XF86AudioMicMute, exec, pactl set-source-mute @DEFAULT_SOURCE@ toggle
        bind = ,XF86AudioPrev, exec, playerctl previous
        bind = ,XF86AudioPlay, exec, playerctl play-pause
        bind = ,XF86AudioNext, exec, playerctl next

        bind = ,Print, exec, grim -g "$(slurp)" - | wl-copy 
        bind = ALT, Print, exec, slurp | grim -g - - | wl-copy && wl-paste > /home/guifuentes8/Pictures/$(date +'%Y-%m-%d-%H%M%S_grim.png') 
        bind = CTRL,Print, exec, wf-recorder --audio=alsa_output.pci-0000_00_1f.3.analog-stereo.4.monitor -c vp8_vaapi -d /dev/dri/renderD128 -f ~/Videos/record_$(date +"%Y-%m-%d_%H:%M:%S.webm") 
        bind = CTRL_SHIFT,Print, exec, wf-recorder --audio=alsa_output.pci-0000_00_1f.3.analog-stereo.4.monitor -g "$(slurp)" -c vp8_vaapi -d /dev/dri/renderD128 -f ~/Videos/record_$(date +"%Y-%m-%d_%H:%M:%S.webm") 
        bind = SHIFT, Print, exec, pkill wf-recorder

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

        blurls = waybar
        windowrule = noblur,^(firefox)$ # disables blur for firefox
        windowrule = float,^(mpv)$
        windowrule = size 960 520,^(mpv)$
        windowrule = center,^(mpv)$
    '';
  };
}