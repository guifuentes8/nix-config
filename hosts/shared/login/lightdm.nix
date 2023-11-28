{ pkgs, unstable, outputs, lib, ... }:
let
  catppuccin_name = "Catppuccin-Mocha-Standard-Blue-Dark";
  catppuccin_gtk = unstable.catppuccin-gtk.override
    {
      accents = [ "blue" ]; # You can specify multiple accents here to output multiple themes
      size = "standard";
      tweaks = [ "rimless" ]; # You can also specify multiple tweaks here
      variant = "mocha";
    };
in
{
  services.xserver = {
    enable = true;
    displayManager = {
      lightdm = {
        background = ./wallpaper.png;
        enable = true;
        greeters = {
          gtk = {
            enable = true;
            theme = {
              name = "${catppuccin_name}";
              package = catppuccin_gtk;
            };
            iconTheme = {
              name = "BeautyLine";
              package = pkgs.beauty-line-icon-theme;
            };
            cursorTheme = {
              name = "Catppuccin-Mocha-Dark";
              package = unstable.catppuccin-cursors.mochaDark;
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
