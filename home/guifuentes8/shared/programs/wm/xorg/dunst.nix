{ pkgs, ... }:
{
  services.dunst = {
    enable = true;
    package = pkgs.dunst;
    iconTheme.size = "64x64";
    iconTheme.package = pkgs.gnome.adwaita-icon-theme;
    iconTheme.name = "Adwaita";
    settings = {
      global = {
        width = 300;
        height = 300;
        transparency = 10;
        font = "JetBrainsMono Nerd 12";
        corner_radius = 12;
        origin = "top-right";
        notification_limit = 0;
        frame_width = 1;
        frame_color = "#5b6078";
        separator_color = "frame";
      };
      urgency_normal = {
        background = "#24273A";
        foreground = "#CAD3F5";
        timeout = 10;
      };
    };
  };
}
