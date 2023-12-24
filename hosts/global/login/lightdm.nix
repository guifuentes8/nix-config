{ pkgs, unstable, outputs, lib, ... }:
let
  my_config = outputs.packages.${pkgs.system}.my_config;
  gtk_theme_name = "Lavanda-Sea-Dark";
  gtk_theme = outputs.packages.${pkgs.system}.lavanda_gtk;
in
{
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
              name = "phinger-cursors";
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
