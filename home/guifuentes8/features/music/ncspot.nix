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
      credentials = {
        username_cmd = "echo guifuentes8@gmail.com";
        password_cmd = "${pkgs.pass}/bin/pass spotify/secret";
      };
      theme = {
        background = "#${config.colorScheme.colors.base00}";
        primary = "#${config.colorScheme.colors.base06}";
        secondary = "#${config.colorScheme.colors.base0C}";
        title = "#${config.colorScheme.colors.base0C}";
        playing = "#${config.colorScheme.colors.base08}";
        playing_selected = "#${config.colorScheme.colors.base0D}";
        playing_bg = "#${config.colorScheme.colors.base00}";
        highlight = "#${config.colorScheme.colors.base0D}";
        highlight_bg = "#${config.colorScheme.colors.base00}";
        error = "#${config.colorScheme.colors.base0F}";
        error_bg = "#${config.colorScheme.colors.base00}";
        statusbar = "#${config.colorScheme.colors.base0D}";
        statusbar_progress = "#${config.colorScheme.colors.base0D}";
        statusbar_bg = "#${config.colorScheme.colors.base00}";
        cmdline = "#${config.colorScheme.colors.base09}";
        cmdline_bg = "#${config.colorScheme.colors.base00}";
        search_match = "#${config.colorScheme.colors.base08}";
      };

    };
  };
}
