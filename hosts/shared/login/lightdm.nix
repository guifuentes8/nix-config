{ pkgs, unstable, outputs, lib, ... }:
let lavanda-gtk-theme = outputs.packages.${pkgs.system}.lavanda-gtk-theme;
in
{
  services.xserver = {
    enable = true;
    displayManager = {
      # defaultSession = lib.mkDefault "deepin";
      lightdm = {
        background = ./wallpaper.png;
        enable = true;
        greeters = {
          gtk = {
            enable = true;
            theme = {
              name = "Lavanda-Dark";
              package = lavanda-gtk-theme;
            };
            iconTheme = {
              name = "BeautyLine";
              package = pkgs.beauty-line-icon-theme;
            };
            cursorTheme = {
              name = "Phinger Cursors";
              package = pkgs.phinger-cursors;
              size = 32;
            };
            # clock-format = null;
            indicators = [
              "~host"
              "~spacer"
              "~clock"
              "~spacer"
              "~session"
              "~language"
              "~a11y"
              "~power"
            ];
            extraConfig = '''';
          };
        };
      };
    };
  };
}
