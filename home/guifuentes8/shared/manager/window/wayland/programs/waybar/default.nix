{ pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar.overrideAttrs (oa:
      {
        mesonFlags = (oa.mesonFlags or  [ ]) ++ [ "-Dexperimental=true" ];
      });
    systemd.enable = true;
    style = ''

      * {
          font-family: JetBrainsMonoNL Nerd Font;
          font-weight: bold;
          font-size: 14px;
          min-height: 0;
      }

      window#waybar {
          background: rgba(49, 50, 68, 0.8);
          color: #cdd6f4;
      }

      #cpu,
      #memory,
      #disk,
      #temperature,
      #keyboard-state,
      #clock,
      #battery,
      #pulseaudio,
      #network,
      #tray,
      #backlight {
      background: #181825;
      padding: 4px 10px;
      margin: 8px 4px;
      border-radius: 12px;
      }

      #workspaces {
        background: #181825;
        padding: 0px 4px;
        margin: 4px 8px;
        border-radius: 12px;
        font-size: 16px;
      }


      #workspaces button {
        color: #cdd6f4;
        padding: 0px 4px 0px 0px;
        font-size: 16px;
        margin: 0px 4px;

      }

      #workspaces button.active {
        color: #a6e3a1;
        background-color: rgba(0,0,0,0);
      }

      #workspaces button.focused {
        color: #74c7ec;
        border-radius: 24px;
      }

      #workspaces button.urgent {
        color: #11111b;
        background: #f38ba8;
        border-radius: 10px;
      }

      #workspaces button:hover {
        background-color: rgba(0,0,0,0);
        color: #74c7ec;
      }

      
      #disk {
        color: #f5e0dc;
      }
      
      #cpu {
        color: #cba6f7;
      }
      
      #memory {
        color: #cba6f7;
      }
      
      #temperature {
        color: #cba6f7;
      }
      
      #keyboard-state {
        color: #f38ba8;
      }
      
      #network {
        color: #eba0ac;
      }
      
      #backlight {
        color: #fab387;
      }
      
      #pulseaudio {
        color: #f9e2af;
      }
      
      #battery {
        color: #94e2d5;
      }

      #clock {
        color: #89dceb;
        margin-right: 12px;
      }

      #tray {
        margin-right: 12px;
      }

      #custom-nix-logo {
        margin-left: 12px;
      }

      #mpris {
        color: #a6e3a1;
        margin-left: 12px;
      }

       #custom-media {
        color: #a6e3a1;
        margin-left: 12px;
      }
    '';

    settings = [
      {
        mode = "dock";
        fixed-center = true;
        layer = "top";
        position = "top";
        height = 0;
        modules-left = [ "custom/nix-logo" "wlr/workspaces" "mpris" ];
        modules-center = [ ];
        modules-right = [ "disk" "cpu" "memory" "temperature" "keyboard-state" "network" "backlight" "pulseaudio" "battery" "clock" "tray" ];
        "custom/media" = {
          "format" = "{icon}{}";
          "return-type" = "json";
          "format-icons" = {
            "Playing" = " ";
            "Paused" = " ";
          };
          "max-length" = 70;
          "exec" = "playerctl -a metadata --format '{\"text\": \"{{playerName}}: {{artist}} - {{markup_escape(title)}}\", \"tooltip\": \"{{playerName}} : {{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}' -F";
          "on-click" = "playerctl play-pause";
        };
        "custom/nix-logo" = {
          "format" = "<span font='16'> </span>";
        };
        "wlr/workspaces" = {
          "all-outputs" = true;
          "active-only" = false;
          "on-scroll-up" = "hyprctl dispatch workspace e+1";
          "on-scroll-down" = "hyprctl dispatch workspace e-1";
          "on-click" = "activate";
          "format" = "{icon}";
          "format-icons" = {
            "1" = "<span font='16' rise='1000'>󰲡</span>";
            "2" = "<span font='16' rise='1000'>󰲣</span>";
            "3" = "<span font='16' rise='1000'>󰲥</span>";
            "4" = "<span font='16' rise='1000'>󰲧</span>";
            "5" = "<span font='16' rise='1000'>󰲩</span>";
            "6" = "<span font='16' rise='1000'>󰲫</span>";
            "7" = "<span font='16' rise='1000'>󰲭</span>";
            "8" = "<span font='16' rise='1000'>󰲯</span>";
            "9" = "<span font='16' rise='1000'>󰲱</span>";
            "urgent" = "";
            "active" = "<span font='16' rise='1000'></span>";
            "default" = "";
          };
        };
        "keyboard-state" = {
          "numlock" = true;
          "capslock" = true;
          "format" = "{icon} {name} ";
          "format-icons" = {
            "locked" = "";
            "unlocked" = "";
          };
        };
        "sway/mode" = {
          "format" = "<span style=\"italic\">{}</span>";
        };
        "sway/scratchpad" = {
          "format" = "{icon} {count}";
          "show-empty" = false;
          "format-icons" = [ "" "" ];
          "tooltip" = true;
          "tooltip-format" = "{app}= {title}";
        };
        "cava" = {
          "cava_config" = "$XDG_CONFIG_HOME/cava/cava.conf";
          "framerate" = 60;
          "autosens" = 1;
          "sensitivity" = 100;
          "bars" = 14;
          "lower_cutoff_freq" = 50;
          "higher_cutoff_freq" = 10000;
          "method" = "pulse";
          "source" = "auto";
          "stereo" = true;
          "reverse" = false;
          "bar_delimiter" = 0;
          "monstercat" = false;
          "waves" = false;
          "noise_reduction" = 0.77;
          "input_delay" = 2;
          "format-icons" = [ "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
          "actions" = {
            "on-click-right" = "mode";
          };
        };
        "mpris" = {
          "format" = "{player_icon} {length} | {artist} - {title} ";
          "format-paused" = "{status_icon} {length} | {artist} - {title}";
          interval = 2;
          "player-icons" = {
            "default" = "▶";
            "mpv" = "🎵";
            "spotify_player" = " ";
          };
          "status-icons" = {
            "paused" = "⏸";
          };
          "ignored-players" = [ "firefox" "chromium" ];
        };
        "mpd" = {
          "format" = "{stateIcon} {consumeIcon}{randomIcon}{repeatIcon}{singleIcon}{artist} - {album} - {title} ({elapsedTime=%M=%S}/{totalTime=%M=%S}) ⸨{songPosition}|{queueLength}⸩ {volume}% ";
          "format-disconnected" = "Disconnected ";
          "format-stopped" = "{consumeIcon}{randomIcon}{repeatIcon}{singleIcon}Stopped ";
          "unknown-tag" = "N/A";
          "interval" = 2;
          "consume-icons" = {
            "on" = " ";
          };
          "random-icons" = {
            "off" = "<span color=\"#f53c3c\"></span> ";
            "on" = " ";
          };
          "repeat-icons" = {
            "on" = " ";
          };
          "single-icons" = {
            "on" = "1 ";
          };
          "state-icons" = {
            "paused" = "";
            "playing" = "";
          };
          "tooltip-format" = "MPD (connected)";
          "tooltip-format-disconnected" = "MPD (disconnected)";
        };
        "idle_inhibitor" = {
          "format" = "{icon}";
          "format-icons" = {
            "activated" = "";
            "deactivated" = "";
          };
        };
        "tray" = {
          "icon-size" = 21;
          "spacing" = 10;
        };
        "clock" = {
          "timezone" = "America/Sao_Paulo";
          "format" = "{:%H:%M:%S}";
          interval = 1;
          tooltip = true;
          "tooltip-format" = "{:%d/%m/%Y}";
          "format-alt" = "{%d-%m-%y}";
        };
        "disk" = {
          "interval" = 30;
          "format" = "󰋊 {total} | 󱁋 {percentage_free}% | 󱁌 {percentage_used}%";
          "path" = "/";
        };
        "cpu" = {
          interval = 2;
          "format" = "󰻠 {usage}%";
          "tooltip" = true;
        };
        "memory" = {
          "format" = "󰍛 {}%";
        };
        "temperature" = {
          "thermal-zone" = 2;
          "critical-threshold" = 80;
          "format-critical" = "{icon} {temperatureC}°C";
          "format" = "{icon} {temperatureC}°C";
          "format-icons" = [ "" "" "" ];
        };
        "backlight" = {
          "device" = "acpi_video1";
          "format" = "{icon} {percent}%";
          "format-icons" = [ "" "" "" "" "" "" "" "" "" ];
        };
        "battery" = {
          "states" = {
            "good" = 100;
            "warning" = 30;
            "critical" = 15;
          };
          "format" = "{icon} {capacity}%";
          "format-charging" = " {capacity}%";
          "format-plugged" = " {capacity}%";
          "format-alt" = "{time} {icon}";
          "format-good" = "{icon} {capacity}%";
          "format-full" = "{icon} {capacity}%";
          "format-icons" = [ " " " " " " " " " " ];
        };
        "battery#bat2" = {
          "bat" = "BAT2";
        };
        "network" = {
          "interface" = "wlp2*";
          "format-wifi" = "  {essid}";
          "format-ethernet" = "{ipaddr}/{cidr} ";
          "tooltip-format" = "{ifname} via {gwaddr} ";
          "format-linked" = "{ifname} (No IP) ";
          "format-disconnected" = "Disconnected ⚠";
          "format-alt" = "{Signal} - {signalStrength}%";
        };
        "pulseaudio" = {
          "scroll-step" = 1;
          "format" = "{icon} {volume}%";
          "format-bluetooth" = "󰋋 {volume}%";
          "format-bluetooth-muted" = "󰟎 {volume}%";
          "format-muted" = "󰖁 {volume}%";
          "format-source" = "";
          "format-source-muted" = "";
          "format-icons" = {
            "headphone" = "󰋋";
            "hands-free" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = [ "" "" "" ];
          };
          "on-click" = "pavucontrol";
        };
      }
    ];

  };

}

