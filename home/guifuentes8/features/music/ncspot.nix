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
        background = "#${config.colorScheme.palette.base00}";
        primary = "#${config.colorScheme.palette.base06}";
        secondary = "#${config.colorScheme.palette.base0C}";
        title = "#${config.colorScheme.palette.base0C}";
        playing = "#${config.colorScheme.palette.base08}";
        playing_selected = "#${config.colorScheme.palette.base0D}";
        playing_bg = "#${config.colorScheme.palette.base00}";
        highlight = "#${config.colorScheme.palette.base0D}";
        highlight_bg = "#${config.colorScheme.palette.base00}";
        error = "#${config.colorScheme.palette.base0F}";
        error_bg = "#${config.colorScheme.palette.base00}";
        statusbar = "#${config.colorScheme.palette.base0D}";
        statusbar_progress = "#${config.colorScheme.palette.base0D}";
        statusbar_bg = "#${config.colorScheme.palette.base00}";
        cmdline = "#${config.colorScheme.palette.base09}";
        cmdline_bg = "#${config.colorScheme.palette.base00}";
        search_match = "#${config.colorScheme.palette.base08}";
      };

    };
  };
}
