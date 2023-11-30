{ unstable, pkgs, lib, config, ... }:
{

  home.packages = [
    unstable.spotify-player
  ];

  xdg.configFile."spotify-player/app.toml".source = (pkgs.formats.toml { }).generate "app.toml"
    {
      client_id = "32c1c3d388a14e4981d80295af909be7";
      theme = "Catppuccin-mocha";
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
        bitrate = 320;
      };
    };


  xdg.configFile."spotify-player/theme.toml".source = (pkgs.formats.toml { }).generate "theme.toml"
    {
      themes = [{
        name = "Catppuccin-mocha";
        palette = {
          background = "#${config.colorScheme.colors.base00}";
          foreground = "#${config.colorScheme.colors.base05}";
          black = "#${config.colorScheme.colors.base01}";
          blue = "#${config.colorScheme.colors.base0D}";
          cyan = "#${config.colorScheme.colors.base0C}";
          green = "#${config.colorScheme.colors.base0B}";
          magenta = "#${config.colorScheme.colors.base0E}";
          red = "#${config.colorScheme.colors.base08}";
          white = "#${config.colorScheme.colors.base07}";
          yellow = "#${config.colorScheme.colors.base0A}";
          bright_black = "#1E1E2E";
          bright_blue = "#89B4FA";
          bright_cyan = "#89DCEB";
          bright_green = "#A6E3A1";
          bright_magenta = "#CBA6F7";
          bright_red = "#F38BA8";
          bright_white = "#CDD6F4";
          bright_yellow = "#F9E2AF";

        };
        component_style = {
          selection = {
            bg = { Rgb = { r = 49; g = 50; b = 68; }; };
            modifiers = [ "Bold" ];
          };
        };
      }];
    };
}