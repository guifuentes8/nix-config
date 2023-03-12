{ outputs, pkgs, ... }:


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
        primary = "#c6a0f6";
        secondary = "#f5a97f";
        title = "#f5a97f";
        playing = "#a6da95";
        playing_selected = "#1e2030";
        playing_bg = "default";
        highlight = "#1e2030";
        highlight_bg = "#a6da95";
        error = "black";
        error_bg = "#f38ba8";
        statusbar = "#1e2030";
        statusbar_progress = "#91d7e3";
        statusbar_bg = "#91d7e3";
        cmdline = "#f4dbd6";
        cmdline_bg = "#1e2030";
        search_match = "#f38ba8";
      };

    };
  };
}
