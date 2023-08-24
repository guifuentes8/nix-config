{ config, lib, pkgs, ... }:
{
  home.packages = [
    pkgs.cava
  ];

  xdg.configFile."cava/config".text = lib.generators.toINI { } {
    general = {
      framerate = 60;
      bar_width = 2;
      bar_spacing = 1;
    };
    input = {
      method = "pulse";
    };
    output = {
      method = "ncurses";
      alacritty_sync = 0;
    };
    color = {
      gradient = 1;
      gradient_count = 8;
      gradient_color_1 = "'#${config.colorScheme.colors.base0C}'";
      gradient_color_2 = "'#${config.colorScheme.colors.base0B}'";
      gradient_color_3 = "'#${config.colorScheme.colors.base00}'";
      gradient_color_4 = "'#${config.colorScheme.colors.base0A}'";
      gradient_color_5 = "'#${config.colorScheme.colors.base0F}'";
      gradient_color_6 = "'#${config.colorScheme.colors.base08}'";
      gradient_color_7 = "'#${config.colorScheme.colors.base0E}'";
      gradient_color_8 = "'#${config.colorScheme.colors.base0E}'";

    };
    smoothing = {
      # noise_reduction = 0.77;
      monstercat = 0;
      waves = 0;
    };
  };
}
