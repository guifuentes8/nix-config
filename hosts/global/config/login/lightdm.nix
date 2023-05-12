{ pkgs, ... }:
let wallpaper = /home/guifuentes8/.config/wallpapers/images/5120x1440/alone.png;
in
{

  services.xserver = {
    displayManager.lightdm = {
      background = wallpaper;
      enable = true;
      greeters = {
        gtk = {
          enable = true;
          theme = {
            name = "Adwaita";
          };
          iconTheme = {
            name = "Adwaita";
          };
          cursorTheme = {
            name = "Catppuccin-Mocha-Dark-Cursors";
            package = pkgs.catppuccin-cursors.mochaDark;
            size = 24;
          };
          clock-format = "%H:%M:%D";
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
        };
      };
    };
  };
}
