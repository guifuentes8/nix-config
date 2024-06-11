{ lib, config, pkgs, ... }:
let
  cw = ./cw.sh;
  term = "footclient";
  startupScript = pkgs.writeShellScriptBin "start" ''
    swww-daemon & 
    wl-clipboard-history -t &
    dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &
    systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &

  '';
in
{
  imports = [ ./common/wayland.nix ];
  services.gnome-keyring.enable = true;
  #services.hyprpaper.enable = true;
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    systemd.variables = [ "--all" ];
    settings = {
      exec-once = "${startupScript}/bin/start";
      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        "col.active_border" =
          lib.mkDefault "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = lib.mkDefault "rgba(595959aa)";

        resize_on_border = false;

        allow_tearing = false;

        layout = "dwindle";
      };
      decoration = {
        rounding = 10;

        active_opacity = 1.0;
        inactive_opacity = 1.0;

        drop_shadow = true;
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = lib.mkDefault "rgba(1a1a1aee)";

        blur = {
          enabled = true;
          size = 3;
          passes = 1;

          vibrancy = 0.1696;
        };
      };
      animations = {
        enabled = true;

        # Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

        animation = [
          "windowsOut, 1, 7, default, popin 80%"
          "windows, 1, 7, myBezier"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        pseudotile =
          true; # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true; # You probably want this
      };

      master = { new_is_master = true; };

      misc = {
        force_default_wallpaper =
          -1; # Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo =
          false; # If true disables the random hyprland logo / anime girl background. :(
      };

    };

    extraConfig = ''
            # ON START
                         # MONITORS
             monitor=,preferred,auto,1

          # https://wiki.hyprland.org/Configuring/Variables/#general

      # https://wiki.hyprland.org/Configuring/Variables/#decoration

      # https://wiki.hyprland.org/Configuring/Variables/#animations

      #############
      ### INPUT ###
      #############

      # https://wiki.hyprland.org/Configuring/Variables/#input
      input {
          kb_layout = us
          kb_variant =
          kb_model =
          kb_options =
          kb_rules =

          follow_mouse = 1

          sensitivity = 0 # -1.0 - 1.0, 0 means no modification.

          touchpad {
              natural_scroll = false
          }
      }

      # https://wiki.hyprland.org/Configuring/Variables/#gestures
      gestures {
          workspace_swipe = false
      }

      # Example per-device config
      # See https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs for more
      device {
          name = epic-mouse-v1
          sensitivity = -0.5
      }
            # KEYBINDS

              $mainMod = SUPER
              $term = ${term}

              bind = $mainMod, Return, exec, $term
              bind = $mainMod, Escape, exit,
              bind = CTRL_ALT, Escape, exec, swaylock --screenshots --clock --indicator --indicator-radius 100 --indicator-thickness 7 --effect-blur 7x5 --effect-vignette 0.5:0.5 --ring-color 7aa2f7cc --ring-clear-color 32344a --ring-ver-color e0af68 --ring-wrong-color f7768e --key-hl-color 73dacaee --bs-hl-color f7768e --line-color 00000000 --line-clear 00000000 --line-ver-color 00000000 --line-wrong-color 00000000 --inside-color 00000000 --inside-clear-color 32344a --inside-ver-color 00000000 --inside-wrong-color 00000000 --separator-color 7aa2f7cc --text-color c0caf6 --text-clear-color c0caf6 --text-ver-color c0caf6 --text-wrong-color c0caf6 --grace 2 --fade-in 0.2
              bind = $mainMod, Space, exec, rofi -modes "drun" -show-icons -show drun
              bind = $mainMod, Q, killactive,
              bind = $mainMod, S, togglesplit, # dwindle
              bind = $mainMod, F, togglefloating,
              bind = $mainMod, M, fullscreen, 0

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

              bind=CTRL_SHIFT,R,submap,resize
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
              bind = $mainMod SHIFT, p, exec, ${pkgs.hyprpicker}/bin/hyprpicker -a
              bind = $mainMod SHIFT, b, exec, qutebrowser;
              bind = $mainMod SHIFT, m, exec, ${term} -e spotify_player;
              bind = $mainMod SHIFT, e, exec, ${term} -e nvim;
              bind = $mainMod SHIFT, f, exec, ${term} -e yazi;
              bind = $mainMod, W, exec, bash ${cw} change


              bind = ALT,Space, exec, hyprctl switchxkblayout at-translated-set-2-keyboard next
              bind = ALT,Space, exec, hyprctl switchxkblayout logitech-usb-receiver next

              windowrule = float,^(mpv)$
              windowrule = size 960 520,^(mpv)$
              windowrule = center,^(mpv)$
    '';
  };
}
