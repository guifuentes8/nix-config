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
        primary = "#${config.colorScheme.colors.base0E}";
        secondary = "#${config.colorScheme.colors.base00}";
        title = "#${config.colorScheme.colors.base00}";
        playing = "#${config.colorScheme.colors.base0A}";
        playing_selected = "#${config.colorScheme.colors.base01}";
        playing_bg = "default";
        highlight = "#${config.colorScheme.colors.base01}";
        highlight_bg = "#${config.colorScheme.colors.base00}";
        error = "${config.colorScheme.colors.base01}";
        error_bg = "#${config.colorScheme.colors.base08}";
        statusbar = "#${config.colorScheme.colors.base01}";
        statusbar_progress = "#${config.colorScheme.colors.base00}";
        statusbar_bg = "#${config.colorScheme.colors.base00}";
        cmdline = "#${config.colorScheme.colors.base0B}";
        cmdline_bg = "#${config.colorScheme.colors.base01}";
        search_match = "#${config.colorScheme.colors.base08}";
      };

    };
  };
}
