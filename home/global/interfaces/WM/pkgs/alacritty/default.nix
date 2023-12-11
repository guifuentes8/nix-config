{ unstable, config, ... }: {
  programs.alacritty = {
    enable = true;
    package = unstable.alacritty;
    settings = {
      font = {
        normal = {
          family = "Dank Mono";
          style = "Italic";
        };

        bold = {
          family = "Dank Mono";
          style = "Bold";
        };

        italic = {
          family = "Dank Mono";
          style = "Italic";
        };

        bold_italic = {
          family = "Dank Mono";
          style = "Bold Italic";
        };
        size = 13;
      };
      window = {
        opacity = 0.8;
        padding = { x = 10; y = 10; };
      };

      colors = {
        primary = {
          background = "#${config.colorScheme.colors.base00}"; # base
          foreground = "#${config.colorScheme.colors.base05}"; # text
          # Bright and dim foreground colors
          dim_foreground = "#${config.colorScheme.colors.base05}"; # text
          bright_foreground = "#${config.colorScheme.colors.base05}"; # text
        };

        # Cursor colors
        cursor = {
          text = "#${config.colorScheme.colors.base00}"; # base
          cursor = "#${config.colorScheme.colors.base0D}"; # rosewater
          vi_mode_cursor = {
            text = "#${config.colorScheme.colors.base00}"; # base
            cursor = "#${config.colorScheme.colors.base0D}"; # lavender
          };
        };

        # Search colors
        search = {
          matches = {
            foreground = "#${config.colorScheme.colors.base00}"; # base
            background = "#${config.colorScheme.colors.base04}"; # subtext0
            focused_match = {
              foreground = "#${config.colorScheme.colors.base00}"; # base
              background = "#${config.colorScheme.colors.base0B}"; # green
            };
            footer_bar = {
              foreground = "#${config.colorScheme.colors.base00}"; # base
              background = "#${config.colorScheme.colors.base04}"; # subtext0
            };
          };
        };

        # Keyboard regex hints
        hints = {
          start = {
            foreground = "#${config.colorScheme.colors.base00}"; # base
            background = "#${config.colorScheme.colors.base0A}"; # yellow
          };
          end = {
            foreground = "#${config.colorScheme.colors.base00}"; # base
            background = "#${config.colorScheme.colors.base04}"; # subtext0
          };
        };

        # Selection colors
        selection = {
          text = "#${config.colorScheme.colors.base06}"; # base
          background = "#${config.colorScheme.colors.base03}"; # rosewater
        };

        # Normal colors
        normal = {
          black = "#${config.colorScheme.colors.base02}"; # surface1
          red = "#${config.colorScheme.colors.base08}"; # red
          green = "#${config.colorScheme.colors.base09}"; # green
          yellow = "#${config.colorScheme.colors.base0A}"; # yellow
          blue = "#${config.colorScheme.colors.base0B}"; # blue
          magenta = "#${config.colorScheme.colors.base0C}"; # pink
          cyan = "#${config.colorScheme.colors.base0D}"; # teal
          white = "#${config.colorScheme.colors.base07}"; # subtext1
        };

        # Bright colors
        bright = {
          black = "#${config.colorScheme.colors.base02}"; # surface1
          red = "#${config.colorScheme.colors.base08}"; # red
          green = "#${config.colorScheme.colors.base09}"; # green
          yellow = "#${config.colorScheme.colors.base0A}"; # yellow
          blue = "#${config.colorScheme.colors.base0B}"; # blue
          magenta = "#${config.colorScheme.colors.base0C}"; # pink
          cyan = "#${config.colorScheme.colors.base0D}"; # teal
          white = "#${config.colorScheme.colors.base07}"; # subtext1
        };

        # Dim colors
        dim = {
          black = "#${config.colorScheme.colors.base02}"; # surface1
          red = "#${config.colorScheme.colors.base08}"; # red
          green = "#${config.colorScheme.colors.base09}"; # green
          yellow = "#${config.colorScheme.colors.base0A}"; # yellow
          blue = "#${config.colorScheme.colors.base0B}"; # blue
          magenta = "#${config.colorScheme.colors.base0C}"; # pink
          cyan = "#${config.colorScheme.colors.base0D}"; # teal
          white = "#${config.colorScheme.colors.base07}"; # subtext1
        };

        indexed_colors = [
          {
            index = 16;
            color = "#${config.colorScheme.colors.base00}";
          }
          {
            index = 17;
            color = "#${config.colorScheme.colors.base0F}";
          }
        ];

      };
    };
  };

}
