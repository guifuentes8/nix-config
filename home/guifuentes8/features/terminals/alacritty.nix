{ unstable, pkgs, config, ... }: {
  programs.alacritty = {
    enable = true;
    package = pkgs.alacritty;
    settings = {
     # font = {
     #   normal = {
     #     family = configOptions.styles.font.code;
     #     style = "Regular";
     #   };
#
     #   bold = {
     #     family = configOptions.styles.font.code;
     #     style = "Bold";
     #   };
#
     #   italic = {
     #     family = configOptions.styles.font.code;
     #     style = "Italic";
     #   };
#
     #   bold_italic = {
     #     family = configOptions.styles.font.code;
     #     style = "Bold Italic";
     #   };
     #   size = pkgs.lib.strings.toInt configOptions.styles.font.size;
     # };
     # window = {
     #   opacity = configOptions.styles.wm.opacity;
     #   padding = {
     #     x = 10;
     #     y = 10;
     #   };
     # };

      colors = {
        primary = {
          background = "#${config.colorScheme.palette.base00}"; # base
          foreground = "#${config.colorScheme.palette.base05}"; # text

          # Bright and dim foreground colors
          dim_foreground = "#${config.colorScheme.palette.base05}"; # text
          bright_foreground = "#${config.colorScheme.palette.base05}"; # text
        };

        # Cursor colors
        cursor = {
          text = "#${config.colorScheme.palette.base00}"; # base
          cursor = "#${config.colorScheme.palette.base0D}"; # rosewater
        };

        # Search colors
        search = {
          matches = {
            foreground = "#${config.colorScheme.palette.base00}"; # base
            background = "#${config.colorScheme.palette.base04}"; # subtext0
          };
        };

        # Keyboard regex hints
        hints = {
          start = {
            foreground = "#${config.colorScheme.palette.base00}"; # base
            background = "#${config.colorScheme.palette.base0A}"; # yellow
          };
          end = {
            foreground = "#${config.colorScheme.palette.base00}"; # base
            background = "#${config.colorScheme.palette.base04}"; # subtext0
          };
        };

        # Selection colors
        selection = {
          text = "#${config.colorScheme.palette.base06}"; # base
          background = "#${config.colorScheme.palette.base03}"; # rosewater
        };

        # Normal colors
        normal = {
          black = "#${config.colorScheme.palette.base02}"; # surface1
          red = "#${config.colorScheme.palette.base08}"; # red
          green = "#${config.colorScheme.palette.base09}"; # green
          yellow = "#${config.colorScheme.palette.base0A}"; # yellow
          blue = "#${config.colorScheme.palette.base0B}"; # blue
          magenta = "#${config.colorScheme.palette.base0C}"; # pink
          cyan = "#${config.colorScheme.palette.base0D}"; # teal
          white = "#${config.colorScheme.palette.base07}"; # subtext1
        };

        # Bright colors
        bright = {
          black = "#${config.colorScheme.palette.base02}"; # surface1
          red = "#${config.colorScheme.palette.base08}"; # red
          green = "#${config.colorScheme.palette.base09}"; # green
          yellow = "#${config.colorScheme.palette.base0A}"; # yellow
          blue = "#${config.colorScheme.palette.base0B}"; # blue
          magenta = "#${config.colorScheme.palette.base0C}"; # pink
          cyan = "#${config.colorScheme.palette.base0D}"; # teal
          white = "#${config.colorScheme.palette.base07}"; # subtext1
        };

        # Dim colors
        dim = {
          black = "#${config.colorScheme.palette.base02}"; # surface1
          red = "#${config.colorScheme.palette.base08}"; # red
          green = "#${config.colorScheme.palette.base09}"; # green
          yellow = "#${config.colorScheme.palette.base0A}"; # yellow
          blue = "#${config.colorScheme.palette.base0B}"; # blue
          magenta = "#${config.colorScheme.palette.base0C}"; # pink
          cyan = "#${config.colorScheme.palette.base0D}"; # teal
          white = "#${config.colorScheme.palette.base07}"; # subtext1
        };

        indexed_colors = [
          {
            index = 16;
            color = "#${config.colorScheme.palette.base00}";
          }
          {
            index = 17;
            color = "#${config.colorScheme.palette.base0F}";
          }
        ];

      };
    };
  };

}
