{ pkgs, lib, config, ... }:
{
  xdg.configFile."spotify-player/app.toml".source = ./app.toml;
  xdg.configFile."spotify-player/theme.toml".source = (pkgs.formats.toml { }).generate "theme.toml"
    {
      themes = [{
        name = "Tokyonight-storm";
        palette = {
          background = "#${config.colorScheme.colors.base01}";
          foreground = "#${config.colorScheme.colors.base00}";
          black = "#${config.colorScheme.colors.base02}";
          blue = "#${config.colorScheme.colors.base0B}";
          cyan = "#${config.colorScheme.colors.base00}";
          green = "#${config.colorScheme.colors.base09}";
          magenta = "#${config.colorScheme.colors.base0E}";
          red = "#${config.colorScheme.colors.base08}";
          white = "#${config.colorScheme.colors.base07}";
          yellow = "#${config.colorScheme.colors.base0A}";
          bright_black = "#414868";
          bright_blue = "#7aa2f7";
          bright_cyan = "#7dcfff";
          bright_green = "#9ece6a";
          bright_magenta = "#bb9af7";
          bright_red = "#f7768e";
          bright_white = "#c0caf5";
          bright_yellow = "#e0af68";
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
