{ pkgs, ... }:
let
  alert = pkgs.writeShellScript "alert.sh" ''
    pw-play --volume=0,04 ~/nix-config/home/interfaces/WM/xorg/pkgs/dunst/alert.wav
    
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
        font = "JetBrainsMonoNL Nerd Font 12";
        corner_radius = 12;
        origin = "top-right";
        notification_limit = 0;
        frame_width = 3;
        frame_color = "#e0af68";
        separator_color = "frame";
        min_icon_size = 64;
        max_icon_size = 64;
      };
      urgency_low = {
        background = "#24283b";
        foreground = "#c0caf5";
      };
      urgency_normal = {
        background = "#24283b";
        foreground = "#c0caf5";
        timeout = 7;
      };

      urgency_critical = {
        background = "#24283b";
        foreground = "#c0caf5";
        frame_color = "#ff9e64";
      };
      play_sound = {
        summary = "*";
        script = "${alert}";
      };
    };
  };
}
