{ pkgs, lib, ... }:
{
  services.xserver = {
    displayManager = {
      # defaultSession = lib.mkDefault "deepin";
      lightdm = {
        background = ./wallpaper.png;
        enable = true;
        greeters = {
          gtk = {
            enable = true;
            theme = {
              name = "";
              package = pkgs.gnome.gnome-themes-extra;
            };
            iconTheme = {
              name = "";
              package = pkgs.gnome.adwaita-icon-theme;
            };
            cursorTheme = {
              name = "";
              package = pkgs.gnome.adwaita-icon-theme;
              size = 16;
            };
            clock-format = null;
            indicators = [ ];
            extraConfig = '''';
          };
        };
      };
    };
  };
}
