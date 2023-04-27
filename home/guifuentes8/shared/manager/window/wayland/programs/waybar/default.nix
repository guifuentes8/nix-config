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

      #custom-language,
      #custom-updates,
      #custom-caffeine,
      #custom-weather,
      #window,
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
        color: #cba6f7;
      }

      #workspaces button.focused {
        color: #cba6f7;
        background: #a6e3a1;
        border-radius: 10px;
      }

      #workspaces button.urgent {
        color: #11111b;
        background: #f38ba8;
        border-radius: 10px;
      }

      #workspaces button:hover {
        background-color: #313244;
        color: #cdd6f4;
        border-radius: 10px;
      }

    
    '';

    settings = [
      {
        layer = "top";
        position = "top";
        exclusive = true;
        height = 0;
        modules-left = [ "wlr/workspaces" "wlr/window" ];
        modules-center = [ ];
        modules-right = [ "network" "backlight" "keyboard-state" "sway/language" "pulseaudio" "clock" "battery" "tray" ];
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
        " keyboard-state " = {
          "
              numlock " = true;
          "
              capslock " = true;
          "
              format " = " { name } {icon}";
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
          "tooltip-format" = "<big>{=%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          "format-alt" = "{=%d-%m-%y}";
        };
        "cpu" = {
          "format" = "{usage}% ";
          "tooltip" = false;
        };
        "memory" = {
          "format" = "{}% ";
        };
        "temperature" = {
          "thermal-zone" = 2;
          "hwmon-path" = "/sys/class/hwmon/hwmon2/temp1_input";
          "critical-threshold" = 80;
          "format-critical" = "{temperatureC}°C {icon}";
          "format" = "{temperatureC}°C {icon}";
          "format-icons" = [ "" "" "" ];
        };
        "backlight" = {
          "device" = "acpi_video1";
          "format" = "{percent}% {icon}";
          "format-icons" = [ "" "" "" "" "" "" "" "" "" ];
        };
        "battery" = {
          "states" = {
            "good" = 95;
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
          "format-alt" = "{ifname}= {ipaddr}/{cidr}";
        };
        "pulseaudio" = {
          "scroll-step" = 1;
          "format" = "{icon} {volume}%";
          "format-bluetooth" = "{volume}% {icon} {format_source}";
          "format-bluetooth-muted" = " {icon} {format_source}";
          "format-muted" = " {format_source}";
          "format-source" = "";
          "format-source-muted" = "";
          "format-icons" = {
            "headphone" = "";
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

