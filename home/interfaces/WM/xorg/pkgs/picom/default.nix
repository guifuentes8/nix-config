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
    shadowOffsets = [ 2 4 ];
    shadowOpacity = 0.3;
    shadowExclude = [
      "class_g =  'Polybar'"
      "class_g =  'Dunst'"
      "class_g =  'Rofi'"

    ];
    opacityRules = [ "85:class_g = 'Rofi'" ];

    settings = {
      shadow-radius = 6;
      corner-radius = 10;

      transition-length = 400;
      transition-pow-x = 0.15;
      transition-pow-y = 0.15;
      transition-pow-w = 0.15;
      transition-pow-h = 0.15;
      size-transition = true;

      blur = {
        method = "dual_kawase";
        strength = 4;
        background = true;
        background-frame = false;
        background-fixed = false;
        kern = "3x3box";
      };

      rounded-corners-exclude = [
        "class_g = 'Polybar'"
        "class_g = 'Rofi'"
      ];
    };
  };
}
