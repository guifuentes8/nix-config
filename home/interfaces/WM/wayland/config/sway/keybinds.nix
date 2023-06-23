{ config, lib, pkgs, ... }:
let
  modifier = config.wayland.windowManager.sway.config.modifier;
in
{
  wayland.windowManager.sway.config.keybindings = lib.mkOptionDefault
    {
      # Essencial Functions
      "${modifier}+Escape" = "exit";
      "${modifier}+Return" = "exec foot";
      "${modifier}+q" = "kill";

      # Layout
      "${modifier}+s" = "layout toggle split";
      "${modifier}+space" = "floating toggle";
      "${modifier}+f" = "fullscreen";
      "${modifier}+p" = "pseudo";
      "${modifier}+v" = "splitv";
      "${modifier}+h" = "splith";

      # Rofi
      "${modifier}+f1" = "exec rofi -modes 'file-browser-extended' -show file-browser-extended";
      "${modifier}+f2" = "exec rofi-pulse-select source";
      "${modifier}+f3" = "exec rofi-pulse-select sink";
      "${modifier}+f4" = "exec rofi -modi emoji -show emoji";
      "${modifier}+f5" = "exec rofi -show calc -modi calc -no-show-match -no-sort -kb-accept-entry 'Control+c' -calc-command ' echo - n '{ result }' | wl-copy -sel copy'";
      "${modifier}+f6" = "exec rofi-rbw";
      "${modifier}+f7" = "exec rofi-bluetooth";
      "${modifier}+f8" = "exec rofi -show p -modi p:rofi-power-menu -lines 6";

      # Brightness
      "XF86MonBrightnessUp" = "exec xbacklight -inc 10";
      "XF86MonBrightnessDown" = "exec xbacklight -dec 10";

      # Volume
      "XF86AudioRaiseVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ +5%";
      "XF86AudioLowerVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ -5%";
      "XF86AudioMute" = "exec pactl set-sink-mute @DEFAULT_SINK@ toggle";
      "XF86AudioMicMute" = "exec pactl set-source-mute @DEFAULT_SOURCE@ toggle";

      # Media Keys
      "XF86AudioPrev" = "exec playerctl previous";
      "XF86AudioPlay" = "exec playerctl play-pause";
      "XF86AudioNext" = "exec playerctl next";

      # Print and Video Record
      "Print" = ''exec grim -g "$(slurp)" - | wl-copy'';
      "Alt+Print" = ''exec slurp | grim - g - - | wl-copy && wl-paste > /home/guifuentes8/Pictures/$(date + "%Y-%m-%d-%H%M%S_grim.png")'';
      "Ctrl+Print" = ''exec wf-recorder - -audio = alsa_output.pci-0000_00_1f .3.analog-stereo .4.monitor - c vp8_vaapi - d /dev/dri/renderD128 - f ~/Videos/record_$(date + "%Y-%m-%d_%H:%M:%S.webm")'';
      "Ctrl+shift+Print" = ''exec wf-recorder - -audio = alsa_output.pci-0000_00_1f .3.analog-stereo .4.monitor - g "$(slurp)" - c vp8_vaapi - d /dev/dri/renderD128 - f ~/Videos/record_$(date + "%Y-%m-%d_%H:%M:%S.webm")'';
      "Shift+Print" = "exec pkill wf-recorder";
    };
}
