{ unstable, pkgs, lib, config, ... }: {

  home.packages = [ unstable.spotify-player ];

  xdg.configFile."spotify-player/app.toml".source =
    (pkgs.formats.toml { }).generate "app.toml" {
      client_id = "32c1c3d388a14e4981d80295af909be7";
      theme = "kyoto";
      playback_refresh_duration_in_ms = 0;
      enable_media_control = true;
      enable_cover_image_cache = true;
      page_size_in_rows = 50;
      track_table_item_max_len = 50;
      pause_icon = "⏸";
      liked_icon = "♥";
      play_icon = "▶️";
      border_type = "Rounded";
      progress_bar_type = "Rectangle";
      playback_window_position = "Bottom";
      cover_img_width = 5;
      cover_img_length = 11;
      device = {
        volume = 100;
        audio_cache = true;
        bitrate = 160;
        normalization = true;
      };
    };

  xdg.configFile."spotify-player/theme.toml".source =
    (pkgs.formats.toml { }).generate "theme.toml" {
      themes = [{
        name = "kyoto";
        palette = {
          background = "#${config.colorScheme.palette.base00}";
          foreground = "#${config.colorScheme.palette.base05}";
          black = "#${config.colorScheme.palette.base00}";
          blue = "#${config.colorScheme.palette.base0B}";
          cyan = "#${config.colorScheme.palette.base0D}";
          green = "#${config.colorScheme.palette.base09}";
          magenta = "#${config.colorScheme.palette.base0C}";
          red = "#${config.colorScheme.palette.base08}";
          white = "#${config.colorScheme.palette.base07}";
          yellow = "#${config.colorScheme.palette.base0A}";
          bright_black = "#${config.colorScheme.palette.base00}";
          bright_blue = "#${config.colorScheme.palette.base0B}";
          bright_cyan = "#${config.colorScheme.palette.base0D}";
          bright_green = "#${config.colorScheme.palette.base09}";
          bright_magenta = "#${config.colorScheme.palette.base0C}";
          bright_red = "#${config.colorScheme.palette.base08}";
          bright_white = "#${config.colorScheme.palette.base07}";
          bright_yellow = "#${config.colorScheme.palette.base0A}";
        };
        component_style = {
          #  selection = {
          #    bg = { Rgb = { r = 26; g = 27; b = 38; }; };
          #    fg = { Rgb = { r = 115; g = 218; b = 202; }; };
          #    modifiers = [ "Bold" ];
          #  };
          playback_progress_bar = {
            bg = "BrightBlack";
            fg = "Cyan";
          };
          current_playing = {
            fg = "Red";
            modifiers = [ "Bold" ];
          };
          playback_artists = {
            fg = "Cyan";
            modifiers = [ "Bold" ];
          };
          playback_album = { fg = "Yellow"; };
          playback_metadata = { fg = "Blue"; };
        };
      }];
    };
}
