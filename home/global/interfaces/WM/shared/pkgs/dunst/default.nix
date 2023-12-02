{ pkgs, config, ... }:
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
    iconTheme.package = pkgs.catppuccin-papirus-folders;
    iconTheme.name = "Papirus-Dark";
    settings = {
      global = {
        width = 500;
        height = 300;
        font = "JetBrainsMonoNL Nerd Font 12";
        corner_radius = 14;
        gaps = true;
        gap_size = 10;
        origin = "bottom-right";
        notification_limit = 6;
        frame_width = 2;
        min_icon_size = 64;
        max_icon_size = 64;
        offset = "20x80";
        frame_color = "#${config.colorScheme.colors.base0C}";
        separator_color = "frame";
      };
      urgency_low = {
        background = "#${config.colorScheme.colors.base00}";
        foreground = "#${config.colorScheme.colors.base05}";
      };
      urgency_normal = {
        background = "#${config.colorScheme.colors.base00}";
        foreground = "#${config.colorScheme.colors.base05}";
        timeout = 5;
      };

      urgency_critical = {
        background = "#${config.colorScheme.colors.base00}";
        foreground = "#${config.colorScheme.colors.base05}";
        frame_color = "#${config.colorScheme.colors.base09}";
      };
      play_sound = {
        summary = "*";
        script = "~/nix-config/home/interfaces/WM/xorg/pkgs/dunst/sound.sh";
      };
    };
  };
}

