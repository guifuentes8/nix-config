{ pkgs, unstable, outputs, lib, ... }:
let
  my_config = outputs.packages.${pkgs.system}.my_config;
  gtk_theme_name = "Jasper-Dark";
  gtk_theme = outputs.packages.${pkgs.system}.gtk_theme;
  #cursor = outputs.packages.${pkgs.system}.cursor;
  cursor = pkgs.borealis-cursors;
in {
  services.xserver = {
    enable = true;
    displayManager = {
      lightdm = {
        background = "${my_config}/share/wallpapers/login.png";
        enable = true;
        greeters = {
          gtk = {
            enable = true;
            theme = {
              name = "${gtk_theme_name}";
              package = gtk_theme;
            };
            iconTheme = {
              name = "Tela-circle";
              package = pkgs.tela-circle-icon-theme;
            };
            cursorTheme = {
              name = "Borealis-cursors";
              package = cursor;
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
            extraConfig = "";
          };
        };
      };
    };
  };
}
