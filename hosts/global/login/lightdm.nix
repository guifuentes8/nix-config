{ pkgs, unstable, outputs, lib, theme, ... }:
let
  gtk_theme = pkgs.catppuccin-gtk.override {
    accents = [
      "sapphire"
    ]; # You can specify multiple accents here to output multiple themes
    size = "standard";
    tweaks = [ "normal" "rimless" ]; # You can also specify multiple tweaks here
    variant = "mocha";
  };
  cursor = pkgs.catppuccin-cursors.mochaDark;
in {
  services.xserver = {
    enable = true;
    displayManager = {
      lightdm = {
        background = ./login.png;
        enable = true;
        greeters = {
          gtk = {
            enable = true;
            theme = {
              name = "${theme.gtk_name}";
              package = gtk_theme;
            };
            iconTheme = {
              name = "Tela-circle";
              package = pkgs.tela-circle-icon-theme;
            };
            cursorTheme = {
              name = "${theme.cursor_name}";
              package = cursor;
              size = theme.cursor_size;
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
