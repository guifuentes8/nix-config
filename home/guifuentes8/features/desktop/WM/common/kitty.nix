{ pkgs, config, ... }: {
  programs.kitty = {
    enable = true;
   # font = {
   #   name = "${configOptions.styles.font.code} Regular";
   #   size = pkgs.lib.strings.toInt configOptions.styles.font.size;
   # };
    shellIntegration.enableZshIntegration = true;
    settings = {
     # bold_font = "${configOptions.styles.font.code} Bold";
     # italic_font = "${configOptions.styles.font.code} Medium Italic";
     # bold_italic_font = "${configOptions.styles.font.code} Bold Italic";
     # font_features =
     #   "${configOptions.styles.font.code}-Medium +zero +ss04 +ss07 +ss08 +ss09";
     # background_opacity = "${configOptions.styles.wm.opacity}";
      confirm_os_window_close = 0;
      initial_window_width = 640;
      initial_window_height = 400;
      disable_ligatures = "never";
      window_padding_width = "4 3 2";

      # The basic colors
      foreground = "#${config.colorScheme.palette.base05}";
      background = "#${config.colorScheme.palette.base00}";
      selection_foreground = "#${config.colorScheme.palette.base00}";
      selection_background = "#${config.colorScheme.palette.base07}";

      # Cursor colors
      cursor = "#${config.colorScheme.palette.base0C}";
      cursor_text_color = "#${config.colorScheme.palette.base01}";
      cursor_shape = "block";

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
      color0 = "#${config.colorScheme.palette.base04}";
      color8 = "#${config.colorScheme.palette.base04}";
      # red
      color1 = "#${config.colorScheme.palette.base08}";
      color9 = "#${config.colorScheme.palette.base08}";

      # green="
      color2 = "#${config.colorScheme.palette.base0B}";
      color10 = "#${config.colorScheme.palette.base0B}";

      # yello="w
      color3 = "#${config.colorScheme.palette.base0A}";
      color11 = "#${config.colorScheme.palette.base0A}";

      # blue
      color4 = "#${config.colorScheme.palette.base0D}";
      color12 = "#${config.colorScheme.palette.base0D}";

      # magen="ta
      color5 = "#${config.colorScheme.palette.base0E}";
      color13 = "#${config.colorScheme.palette.base0E}";

      # cyan
      color6 = "#${config.colorScheme.palette.base0C}";
      color14 = "#${config.colorScheme.palette.base0C}";

      # white="
      color7 = "#${config.colorScheme.palette.base07}";
      color15 = "#${config.colorScheme.palette.base07}";
    };
  };
}
