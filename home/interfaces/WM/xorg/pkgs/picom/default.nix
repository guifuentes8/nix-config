{ pkgs, ... }: {
  services.picom = {
    enable = true;
    package = pkgs.picom-jonaburg;
    extraArgs = [ "--experimental-backends" ];
    backend = "glx";
    vSync = true;
    fade = true;
    fadeSteps = [ 0.04 0.04 ];
    shadow = true;
    shadowOffsets = [ 2 1 ];
    shadowOpacity = 0.4;
    shadowExclude = [
      "class_g = 'Polybar'"
      # "class_g = 'Dunst'"
      "_GTK_FRAME_EXTENTS@:c"

    ];
    opacityRules = [
      "80:class_g = 'Rofi'"
      "90:class_g = 'Polybar'"
      "95:class_g = 'Code'"
      #"90:class_g = 'Dunst'"
    ];

    settings =
      {
        shadow-radius = 9;
        corner-radius = 12;
        refresh-rate = 120;

        transition-length = 400;
        transition-pow-x = 0.15;
        transition-pow-y = 0.15;
        transition-pow-w = 0.15;
        transition-pow-h = 0.15;
        size-transition = true;

        blur = {
          method = "dual_kawase";
          strength = 5;
          background = true;
          background-frame = false;
          background-fixed = false;
          kern = "3x3box";
        };


        rounded-corners-exclude = [
          "class_g = 'Polybar'"
        ];
      };
  };
}