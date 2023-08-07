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
    iconTheme.package = pkgs.colloid-icon-theme;
    iconTheme.name = "Adwaita";
    settings = {
      global = {
        width = 700;
        height = 300;
        font = "JetBrainsMonoNL Nerd Font 12";
        corner_radius = 12;
        origin = "top-center";
        notification_limit = 0;
        frame_width = 3;
        separator_color = "frame";
        min_icon_size = 64;
        max_icon_size = 64;
        offset = "0x80";
      };
      urgency_low = {
        background = "#16161e";
        foreground = "#c0caf5";
        frame_color = "#c0caf5";
      };
      urgency_normal = {
        background = "#1a1b26";
        foreground = "#c0caf5";
        frame_color = "#c0caf5";
        timeout = 3;
      };

      urgency_critical = {
        background = "#292e42";
        foreground = "#db4b4b";
        frame_color = "#db4b4b";
      };
      play_sound = {
        summary = "*";
        script = "${alert}";
      };
    };
  };
}

