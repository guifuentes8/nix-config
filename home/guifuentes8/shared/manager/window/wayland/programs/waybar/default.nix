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
          background: #1e1e2e;
          color: #cdd6f4;
      }

      #cpu,
      #memory,
      #disk,
      #temperature,
      #keyboard-state,
      #window,
      #mpris,
      #clock,
      #battery,
      #pulseaudio,
      #network,
      #workspaces,
      #tray,
      #backlight {
      background: #313244;
      padding: 4px 10px;
      margin: 8px 4px;
      border-radius: 10px;
      }

      #workspaces button {
        padding: 3px;
        color: #45475a;
        margin-right: 5px;
      }

      #workspaces button.active {
        color: #a6e3a1;
      }

      #workspaces button.focused {
        color: #a6e3a1;
        border-radius: 10px;
      }

      #workspaces button.urgent {
        color: #11111b;
        background: #f38ba8;
        border-radius: 10px;
      }

      #workspaces button:hover {
        color: #a6e3a1;
        border-radius: 10px;
      }

      #mpris {
        color: #cba6f7;
      }
      #cpu {
        color: #89b4fa;
      }
      #memory {
        color: #f9e2af;
      }
      #temperature {
        color: #eba0ac;
       }
      #disk {
        color: #b4befe;
      }
      #keyboard-state {
        color: #fab387;
      }
      #clock {
        color: #94e2d5;
      }
      #battery {
        color: #f9e2af;
      }
      #pulseaudio {
        color: #eba0ac;
      }
      #network {
        color: #89b4fa;

      }
      #backlight {
        color: #f5c2e7;

      }
    
    '';

    settings = [
      {
        layer = "top";
        position = "top";
        exclusive = true;
        height = 0;
        modules-left = [ "wlr/workspaces" "user" "disk" "cpu" "memory" "temperature" ];
        modules-center = [ "mpris" ];
        modules-right = [ "keyboard-state" "network" "backlight" "pulseaudio" "battery" "clock" "tray" ];
        "wlr/workspaces" = {
          "on-scroll-up" = "hyprctl dispatch workspace e+1";
          "on-scroll-down" = "hyprctl dispatch workspace e-1";
          "on-click" = "activate";
          "all-outputs" = true;
          "format" = "{icon}";
          "format-icons" = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "";
            "urgent" = "";
            "active" = "";
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
          "format" = "{player_icon} | {title} ";
          "format-paused" = "{status_icon} | {title}";
          interval = 2;
          "player-icons" = {
            "default" = "▶";
            "mpv" = "🎵";
            "spotify_player" = "";
          };
          "status-icons" = {
            "paused" = "⏸";
          };
          "ignored-players" = [ "firefox" ];
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
          "hwmon-path" = "/sys/class/hwmon/hwmon0/temp1_input";
          "critical-threshold" = 80;
          "format-critical" = "{icon} {temperatureC}°C";
          "format" = "{icon} {temperatureC}°C";
          "format-icons" = [ "" "" "" ];
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
        "user" = {
          "format" = "{user} {work_H}:{work_M}";
          "interval" = 60;
          "height" = 30;
          "width" = 30;
          "icon" = true;
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
        "custom/media" = {
          "format" = "{icon} {}";
          "return-type" = "json";
          "max-length" = 40;
          "format-icons" = {
            "spotify" = "";
            "default" = "🎜";
          };
          "escape" = true;
          "exec" = "$HOME/.config/waybar/mediaplayer.py --player spotify 2> /dev/null";
        };
      }
    ];

  };

}

