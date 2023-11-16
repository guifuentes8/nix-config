{ outputs, pkgs, config, ... }:


{
  programs.ncspot = {
    enable = true;
    settings = {
      use_nerdfont = true;
      flip_status_indicators = true;
      volnorm = true;
      notify = true;
      notification_format = {
        title = "%title";
        body = "%artists";
      };
      theme = {
        background = "default";
        primary = "#${config.colorScheme.colors.base06}";
        secondary = "#${config.colorScheme.colors.base0C}";
        title = "#${config.colorScheme.colors.base0C}";
        playing = "#${config.colorScheme.colors.base09}";
        playing_selected = "#${config.colorScheme.colors.base00}";
        playing_bg = "default";
        highlight = "#${config.colorScheme.colors.base00}";
        highlight_bg = "#${config.colorScheme.colors.base0C}";
        error = "${config.colorScheme.colors.base00}";
        error_bg = "#${config.colorScheme.colors.base08}";
        statusbar = "#${config.colorScheme.colors.base00}";
        statusbar_progress = "#${config.colorScheme.colors.base0C}";
        statusbar_bg = "#${config.colorScheme.colors.base0C}";
        cmdline = "#${config.colorScheme.colors.base09}";
        cmdline_bg = "#${config.colorScheme.colors.base00}";
        search_match = "#${config.colorScheme.colors.base08}";
      };

    };
  };
}
