{ config, lib, pkgs, ... }: {
  home.packages = [ pkgs.cava ];

  xdg.configFile."cava/config".text = lib.generators.toINI { } {
    general = {
      framerate = 60;
      bar_width = 1;
      bar_spacing = 1;
    };
    input = { method = "pulse"; };
    output = {
      method = "ncurses";
      alacritty_sync = 0;
    };
    color = {
      gradient = 1;
      gradient_count = 8;

      gradient_color_1 = "'#${config.colorScheme.palette.base00}'";
      gradient_color_2 = "'#${config.colorScheme.palette.base05}'";
      gradient_color_3 = "'#${config.colorScheme.palette.base05}'";
      gradient_color_4 = "'#${config.colorScheme.palette.base0C}'";
      gradient_color_5 = "'#${config.colorScheme.palette.base0C}'";
      gradient_color_6 = "'#${config.colorScheme.palette.base0D}'";
      gradient_color_7 = "'#${config.colorScheme.palette.base0D}'";
      gradient_color_8 = "'#${config.colorScheme.palette.base0E}'";

    };
    smoothing = {
      # noise_reduction = 0.77;
      monstercat = 1;
      waves = 0;
    };
  };
}
