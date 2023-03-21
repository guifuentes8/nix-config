{ pkgs, ... }:
let
  alert = pkgs.writeShellScript "alert.sh" ''
    pw-play --volume=0,04 /home/guifuentes8/dotfiles/home/guifuentes8/shared/manager/window/xorg/programs/dunst/alert.wav
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
        width = 300;
        height = 300;
        font = "JetBrainsMono Nerd 11";
        corner_radius = 12;
        origin = "top-right";
        notification_limit = 0;
        frame_width = 1;
        frame_color = "#5b6078";
        separator_color = "frame";
        min_icon_size = 64;
        max_icon_size = 64;


      };
      urgency_normal = {
        background = "#24273A";
        foreground = "#CAD3F5";
        timeout = 10;
      };
      play_sound = {
        summary = "*";
        script = "${alert}";
      };
    };
  };
}
