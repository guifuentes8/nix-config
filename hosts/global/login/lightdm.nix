{ pkgs, unstable, outputs, lib, ... }:
let
  my-config = outputs.packages.${pkgs.system}.my-config;
  gtk-theme-name = "Kyoto";
  gtk-theme = outputs.packages.${pkgs.system}.kyoto-gtk-theme;
in
{
  services.xserver = {
    enable = true;
    displayManager = {
      lightdm = {
        background = "${my-config}/share/wallpapers/login.png";
        enable = true;
        greeters = {
          gtk = {
            enable = true;
            theme = {
              name = "${gtk-theme-name}";
              package = gtk-theme;
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
