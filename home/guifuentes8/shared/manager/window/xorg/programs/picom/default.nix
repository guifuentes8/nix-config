{ pkgs, ... }: {
  services.picom = {
    enable = true;
    package = pkgs.picom-next;
    extraArgs = [ "--experimental-backends" ];
    backend = "glx";
    vSync = true;
    fade = true;
    fadeSteps = [ 0.04 0.04 ];
    shadow = true;
    shadowOffsets = [ 2 2 ];
    shadowOpacity = 0.2;
    shadowExclude = [
      "class_g = 'Polybar'"
      "_GTK_FRAME_EXTENTS@:c"
    ];
    opacityRules = [
      "80:class_g = 'Rofi'"
    ];

    settings =
      {
        corner-radius = 11;
        shadow-radius = 7;

        transition-length = 300;
        transition-pow-x = 0.1;
        transition-pow-y = 0.1;
        transition-pow-w = 0.1;
        transition-pow-h = 0.1;
        size-transition = true;

        blur = {
          method = "dual_kawase";
          strength = 9;
          background = true;
          background-frame = false;
          background-fixed = false;
          kern = "3x3box";
        };


        rounded-corners-exclude = [
          # "window_type = 'menu'"
          # "window_type = 'dropdown_menu'"
          # "window_type = 'popup_menu'"
          # "window_type = 'utility'"
          "class_g = 'Polybar'"
        ];
      };
  };
}
