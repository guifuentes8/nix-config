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
        frame_color = "#ee5396";
        separator_color = "frame";
        min_icon_size = 64;
        max_icon_size = 64;


      };
      urgency_normal = {
        background = "#2a2a2a";
        foreground = "#3ddbd9";
        timeout = 7;
      };
      play_sound = {
        summary = "*";
        script = "${alert}";
      };
    };
  };
}
