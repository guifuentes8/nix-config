{ pkgs, config, configOptions, ... }: {
  programs.kitty = {
    enable = true;
    font = {
      name = "${configOptions.styles.font.code} Regular";
      size = pkgs.lib.strings.toInt configOptions.styles.font.size;
    };
    shellIntegration.enableZshIntegration = true;
    settings = {
      bold_font = "${configOptions.styles.font.code} Bold";
      italic_font = "${configOptions.styles.font.code} Medium Italic";
      bold_italic_font = "${configOptions.styles.font.code} Bold Italic";
      font_features =
        "${configOptions.styles.font.code}-Medium +zero +ss04 +ss07 +ss08 +ss09";
      background_opacity = "${configOptions.styles.wm.opacity}";
      confirm_os_window_close = 0;
      initial_window_width = 640;
      initial_window_height = 400;
      disable_ligatures = "never";
      # The basic colors
      foreground = "#${config.colorScheme.palette.base05}";
      background = "#${config.colorScheme.palette.base00}";
      selection_foreground = "#${config.colorScheme.palette.base03}";
      selection_background = "#${config.colorScheme.palette.base06}";

      # Cursor colors
      cursor = "#${config.colorScheme.palette.base0C}";
      cursor_text_color = "#${config.colorScheme.palette.base00}";

      # URL underline color when hovering with mouse 
      url_color = "#${config.colorScheme.palette.base0C}";

      # Kitty window border colors
      active_border_color = "#${config.colorScheme.palette.base03}";
      inactive_border_color = "#${config.colorScheme.palette.base03}";
      bell_border_color = "#${config.colorScheme.palette.base09}";

      # Tab bar colors
      active_tab_foreground = "#${config.colorScheme.palette.base0B}";
      active_tab_background = "#${config.colorScheme.palette.base00}";
      inactive_tab_foreground = "#${config.colorScheme.palette.base01}";
      inactive_tab_background = "#${config.colorScheme.palette.base04}";
      tab_bar_background = "#${config.colorScheme.palette.base04}";

      # Colors for marks (marked text in the terminal)
      mark1_foreground = "#${config.colorScheme.palette.base00}";
      mark1_background = "#${config.colorScheme.palette.base03}";
      mark2_foreground = "#${config.colorScheme.palette.base00}";
      mark2_background = "#${config.colorScheme.palette.base06}";
      mark3_foreground = "#${config.colorScheme.palette.base00}";
      mark3_background = "#${config.colorScheme.palette.base06}";

      # The 16 terminal colors
      # black
      color0 = "#494D64 ";
      color8 = "#5B6078 ";
      # red
      color1 = "#ED8796 ";
      color9 = "#ED8796 ";

      # green="
      color2 = "#A6DA95 ";
      color10 = "#A6DA95 ";

      # yello="w
      color3 = "#EED49F ";
      color11 = "#EED49F ";

      # blue
      color4 = "#8AADF4 ";
      color12 = "#8AADF4 ";

      # magen="ta
      color5 = "#F5BDE6 ";
      color13 = "#F5BDE6 ";

      # cyan
      color6 = "#8BD5CA ";
      color14 = "#8BD5CA ";

      # white="
      color7 = "#B8C0E0 ";
      color15 = "#A5ADCB ";
    };
  };
}
