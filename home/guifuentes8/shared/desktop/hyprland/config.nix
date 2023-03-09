{}: ''
   # This is an example Hyprland config file.
  #
  # Refer to the wiki for more information.

  #
  # Please note not all available settings / options are set here.
  # For a full list, see the wiki
  #
  exec-once = mako
  exec-once = wl-clipboard-history -t
  exec-once = dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
  exec-once = systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
  exec-once = waybar

  exec-once = gsettings set org.gnome.desktop.interface gtk-theme Catppuccin-Macchiato-Standard-Blue-Dark
  exec-once = gsettings set org.gnome.desktop.interface cursor-theme Catppuccin-Macchiato-Dark-Cursors
  exec-once = gsettings set org.gnome.desktop.interface cursor-size 32
  exec-once = hyprctl setcursor Catppuccin-Macchiato-Dark-Cursors 32

  exec-once = bash ~/dotfiles/home/guifuentes8/shared/global/software-configs/swww/change-wallpaper.sh init
  
  # See https://wiki.hyprland.org/Configuring/Monitors/

  #monitor=prefered,disable
  monitor=,preferred,auto,1

  monitor=HDMI-A-1, 1920x1080@60, 1920x0, 1

  # See https://wiki.hyprland.org/Configuring/Keywords/ for more

  # Execute your favorite apps at launch
  # exec-once = waybar & hyprpaper & firefox

  # Source a file (multi-file configs)
  # source = ~/.config/hypr/myColors.conf

  # For all categories, see https://wiki.hyprland.org/Configuring/Variables/
  input {
      kb_layout = br
      kb_variant = abnt2
      kb_model =
      kb_options =
      kb_rules =

      # kb_layout = us
      # kb_variant = 
      # kb_model =
      # kb_options =
      # kb_rules =

      follow_mouse = 1

      touchpad {
          natural_scroll = false
      }
          sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
  }

  general {
      # See https://wiki.hyprland.org/Configuring/Variables/ for more

      gaps_in = 5
      gaps_out = 20
      border_size = 3
      col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
      col.inactive_border = rgba(595959aa)

      layout = dwindle
  }

  decoration {
      # See https://wiki.hyprland.org/Configuring/Variables/ for more

      rounding = 8
      blur = true
      blur_size = 12
      blur_passes = 2
      blur_new_optimizations = true
      blur_ignore_opacity = true
      blur_xray = true

      drop_shadow = true
      shadow_range = 4
      shadow_render_power = 3
      col.shadow = rgba(1a1a1aee)

      active_opacity = 1
      inactive_opacity = 1
      fullscreen_opacity = 1
  }

  animations {
      enabled = true

      # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

      bezier = myBezier, 0.05, 0.9, 0.1, 1.05

      animation = windows, 1, 7, myBezier
      animation = windowsOut, 1, 7, default, popin 80%
      animation = border, 1, 10, default
      animation = borderangle, 1, 8, default
      animation = fade, 1, 7, default
      animation = workspaces, 1, 6, default
  }

  dwindle {
      # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
      pseudotile = true # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
      preserve_split = true # you probably want this
  }

  master {
      # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
      new_is_master = true
  }

  gestures {
      # See https://wiki.hyprland.org/Configuring/Variables/ for more
      workspace_swipe = false
  }

  # Example per-device config
  # See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
  device:epic mouse V1 {
      sensitivity = -0.5
  }

  # Example windowrule v1
  # windowrule = float, ^(kitty)$
  # Example windowrule v2
  # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
  # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more


  # See https://wiki.hyprland.org/Configuring/Keywords/ for more
  $mainMod = SUPER

  # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
  bind = $mainMod, Return, exec, kitty
  bind = $mainMod, Q, killactive,
  bind = $mainMod, Escape, exit,
  bind = $mainMod, W, exec, bash ~/dotfiles/home/guifuentes8/shared/global/software-configs/swww/change-wallpaper.sh change
  bind = $mainMod, F, togglefloating,
  bind = $mainMod, D, exec, rofi -modes "drun" -show-icons -show drun
  bind = $mainMod, P, pseudo, # dwindle
  bind = $mainMod, J, togglesplit, # dwindle

  bind = ,XF86MonBrightnessUp, exec, brightnessctl set 5%+
  bind = ,XF86MonBrightnessDown, exec, brightnessctl set 5%-
  bind = ,XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +5%
  bind = ,XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -5%
  bind = ,XF86AudioMute, exec, pactl set-sink-mute @DEFAULT_SINK@ toggle
  bind = ,XF86AudioMicMute, exec, pactl set-source-mute @DEFAULT_SOURCE@ toggle
  bind = ,Print, exec, grim -g "$(slurp)" - | wl-copy 
  bind = CTRL,Print, exec, wf-recorder -a -c vp8_vaapi -d /dev/dri/renderD128 -f ~/Videos/record_$(date +"%Y-%m-%d_%H:%M:%S.webm") 
  bind = CTRL_SHIFT,Print, exec, wf-recorder -a -g "$(slurp)" -c vp8_vaapi -d /dev/dri/renderD128 -f ~/Videos/recorder__$(date +"%Y-%m-%d_%H:%M:%S.webm") 
  bind = ALT, Print, exec, pkill wf-recorder

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

  # Move active window to a workspace with mainMod + SHIFT + [0-9]
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
  lent,22

    blurls=waybar
''