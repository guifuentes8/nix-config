{ pkgs, ... }:
let
  alert = pkgs.writeShellScript "alert.sh" ''
    pw-play --volume=0,04 ~/nix-config/home/guifuentes8/shared/manager/window/xorg/programs/dunst/alert.wav
  '';
in
{
  services.dunst = {
    enable = true;
    package = pkgs.dunst;
    iconTheme.size = "128x128";
    iconTheme.package = pkgs.gnome.adwaita-icon-theme;
    iconTheme.name = "Adwaita";
    settings = {
      global = {
        width = 500;
        height = 300;
        font = "JetBrainsMono Nerd 12";
        corner_radius = 12;
        origin = "top-right";
        notification_limit = 0;
        frame_width = 2;
        frame_color = "#8CAAEE";
        separator_color = "frame";
        min_icon_size = 64;
        max_icon_size = 64;
      };
      urgency_low = {
        background = "#303446";
        foreground = "#C6D0F5";
      };
      urgency_normal = {
        background = "#303446";
        foreground = "#C6D0F5";
        timeout = 7;
      };

      urgency_critical = {
        background = "#303446";
        foreground = "#C6D0F5";
        frame_color = "#EF9F76";
      };
      play_sound = {
        summary = "*";
        script = "${alert}";
      };
    };
  };
}
