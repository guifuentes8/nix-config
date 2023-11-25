{ unstable, pkgs, lib, config, ... }:
{

  home.packages = [
    unstable.spotify-player
  ];

  xdg.configFile."spotify-player/app.toml".source = (pkgs.formats.toml { }).generate "app.toml"
    {
      client_id = "32c1c3d388a14e4981d80295af909be7";
      theme = "Vice";
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
        name = "Catppuccin-frappe";
        palette = {
          background = "#303446";
          foreground = "#C6D0F5";
          black = "#303446";
          blue = "#8CAAEE";
          cyan = "#89DCEB";
          green = "#A6D189";
          magenta = "#CA9EE6";
          red = "#E78284";
          white = "#C6D0F5";
          yellow = "#E5C890";
          bright_black = "#303446";
          bright_blue = "#8CAAEE";
          bright_cyan = "#89DCEB";
          bright_green = "#A6D189";
          bright_magenta = "#CA9EE6";
          bright_red = "#E78284";
          bright_white = "#C6D0F5";
          bright_yellow = "#E5C890";
          # background = "#${config.colorScheme.colors.base00}";
          # foreground = "#${config.colorScheme.colors.base0C}";
          # black = "#${config.colorScheme.colors.base00}";
          # blue = "#${config.colorScheme.colors.base09}";
          # cyan = "#${config.colorScheme.colors.base0C}";
          # green = "#${config.colorScheme.colors.base09}";
          # magenta = "#${config.colorScheme.colors.base08}";
          # red = "#${config.colorScheme.colors.base08}";
          # white = "#${config.colorScheme.colors.base07}";
          # yellow = "#${config.colorScheme.colors.base09}";
          # bright_black = "#414868";
          # bright_blue = "#7aa2f7";
          # bright_cyan = "#7dcfff";
          # bright_green = "#9ece6a";
          # bright_magenta = "#bb9af7";
          # bright_red = "#f7768e";
          # bright_white = "#c0caf5";
          # bright_yellow = "#e0af68";
        };
        component_style = {
          block_title = {
            fg = "Magenta";
          };
          playback_track = {
            fg = "Yellow";
            modifiers = [ "Bold" ];
          };
          playback_album = {
            fg = "Cyan";
          };
          playback_metadata = {
            fg = "Blue";
          };
          playback_progress_bar = {
            bg = "Black";
            fg = "Yellow";
          };
          current_playing = {
            fg = "Yellow";
            modifiers = [ "Bold" ];
          };
          page_desc = {
            fg = "Magenta";
            modifiers = [ "Bold" ];
          };
          table_header = {
            fg = "Magenta";
          };
        };
      }];
    };
}
