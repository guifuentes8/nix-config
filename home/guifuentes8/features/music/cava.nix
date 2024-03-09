{ config, lib, pkgs, ... }: {
  home.packages = [ pkgs.cava ];

  xdg.configFile."cava/config".text = lib.generators.toINI { } {
    general = {
      framerate = 120;
      bar_width = 1;
      bar_spacing = 1;
    };
    input = { method = "pulse"; };
    output = {
      method = "ncurses";
      alacritty_sync = 1;
    };
    color = {
      gradient = 1;
      gradient_count = 8;
      gradient_color_1 = "'#8bd5ca'";
      gradient_color_2 = "'#91d7e3'";
      gradient_color_3 = "'#7dc4e4'";
      gradient_color_4 = "'#8aadf4'";
      gradient_color_5 = "'#c6a0f6'";
      gradient_color_6 = "'#f5bde6'";
      gradient_color_7 = "'#ee99a0'";
      gradient_color_8 = "'#ed8796'";
      # gradient_color_1 = "'#${config.colorScheme.palette.base0C}'";
      # gradient_color_2 = "'#${config.colorScheme.palette.base0B}'";
      # gradient_color_3 = "'#${config.colorScheme.palette.base0B}'";
      # gradient_color_4 = "'#${config.colorScheme.palette.base0B}'";
      # gradient_color_5 = "'#${config.colorScheme.palette.base0B}'";
      # gradient_color_6 = "'#${config.colorScheme.palette.base0B}'";
      # gradient_color_7 = "'#${config.colorScheme.palette.base0B}'";
      # gradient_color_8 = "'#${config.colorScheme.palette.base0B}'";

    };
    smoothing = {
      # noise_reduction = 0.77;
      monstercat = 1;
      waves = 0;
    };
  };
}
