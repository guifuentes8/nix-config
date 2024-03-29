{ pkgs, unstable, outputs, lib, theme, ... }:
let
  gtk-pkg = pkgs.catppuccin-gtk.override {
    accents = [
      "teal"
    ]; # You can specify multiple accents here to output multiple themes
    size = "standard";
    tweaks = [ "rimless" ]; # You can also specify multiple tweaks here
    variant = "mocha";
  };
  gtk-name = "Catppuccin-Mocha-Standard-Teal-Dark";
  icon-pkg = pkgs.catppuccin-papirus-folders.override {
    accent = "teal";
    flavor = "mocha";
  };
  icon-name = "Papirus";
  cursor-name = "Catppuccin-Mocha-Dark-Cursors";
  cursor-pkg = pkgs.catppuccin-cursors.mochaDark;
  cursor-size = 36;
  cursor-size-text = "36";

in {
  services.xserver = {
    enable = true;
    displayManager = {
      lightdm = {
        background = ./login.jpg;
        enable = true;
        greeters = {
          gtk = {
            enable = true;
            theme = {
              name = gtk-name;
              package = gtk-pkg;
            };
            iconTheme = {
              name = icon-name;
              package = icon-pkg;
            };
            cursorTheme = {
              name = cursor-name;
              package = cursor-pkg;
              size = cursor-size;
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
            extraConfig = "";
          };
        };
      };
    };
  };
}
