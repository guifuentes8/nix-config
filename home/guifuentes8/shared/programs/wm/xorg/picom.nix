{ pkgs, ... }: {
  services.picom = {
    enable = true;
    package = pkgs.picom-jonaburg;
    extraArgs = [ "--experimental-backends" ];
    backend = "glx";
    vSync = true;
    settings =
      {
        blur = {
          method = "kawase";
          strength = 9;
          background = true;
          background-frame = false;
          background-fixed = false;
          kern = "3x3box";
        };
        corner-radius = 12;
        transition-length = 300;
        transition-pow-x = 0.1;
        transition-pow-y = 0.1;
        transition-pow-w = 0.1;
        transition-pow-h = 0.1;
        size-transition = true;
        fading = false;
      };
  };
}
