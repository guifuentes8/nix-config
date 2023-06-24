{ inputs, outputs, lib, config, pkgs, ... }:
#let   modifier = config.wayland.windowManager.sway.config.modifier;
let autostart = ../wayland-autostart.sh;
in
{

  imports = [
    ./keybinds.nix
  ];

  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.sway;
    config = {
      modifier = "Mod4";
      bars = [ ];
      colors = {
        background = "#24283b";
        focused = {
          border = "#2ac3de";
          background = "#24283b";
          text = "#ffffff";
          indicator = "#2ac3de";
          childBorder = "#2ac3de";
        };
        focusedInactive = {
          border = "#565f89";
          background = "#24283b";
          text = "#ffffff";
          indicator = "#565f89";
          childBorder = "#565f89";

        };
        placeholder = {
          border = "#565f89";
          background = "#24283b";
          text = "#565f89";
          indicator = "#565f89";
          childBorder = "#565f89";

        };
        unfocused = {
          border = "#565f89";
          background = "#24283b";
          text = "#565f89";
          indicator = "#565f89";
          childBorder = "#565f89";

        };
        urgent = {
          border = "#f7768e";
          background = "#24283b";
          text = "#f7768e";
          indicator = "#f7768e";
          childBorder = "#f7768e";

        };
      };
      defaultWorkspace = null;
      #down = "down";
      #up = "up";
      #left = "left";
      #right = "right";

      floating = {
        border = 3;
        criteria = [ ];
        modifier = "Mod4";
        titlebar = false;
      };

      focus = {
        followMouse = true;
        wrapping = "no";
        mouseWarping = false;
        newWindow = "smart";
      };

      fonts = {
        names = [ "JetBrainsMonoNL Nerd Font" ];
        style = "Regular";
        size = 13.0;
      };

      gaps = {
        bottom = 2;
        top = 2;
        left = 4;
        right = 4;
        horizontal = 2;
        vertical = 2;
        inner = 12;
        outer = 4;
        smartBorders = "off";
        smartGaps = false;
      };

      input = {
        "*" = {
          xkb_variant = "us";
        };
      };

      menu = "rofi -modes 'drun' -show-icons -show drun";

      output = {
        DP-1 = {
          bg = "~/.config/wallpapers/images/5120x1440/w1-5120.png fill";
        };
      };

      seat = {
        "*" = {
          hide_cursor = "when-typing enable";
        };
      };

      startup = [
        { command = "dbus-sway-environment"; }
        { command = "systemctl --user restart waybar"; always = true; }
        { command = "mako"; }
        { command = "${autostart}"; }
      ];

      terminal = "foot";

      window = {
        border = 3;
        commands = [ ];
        hideEdgeBorders = "none";
        titlebar = false;
      };

      workspaceAutoBackAndForth = true;
      workspaceLayout = "default"; # default | stacking | tabbed

    };

    extraConfig = '''';
    extraConfigEarly = '''';
    extraOptions = [ ];
    extraSessionCommands = '''';

    systemd = {
      enable = true;
    };

    wrapperFeatures = {
      gtk = true;
    };

    xwayland = false;

    #extraConfig =
    #  (import ./config.nix {
    #    inherit (config);
    #  });
  };
}
