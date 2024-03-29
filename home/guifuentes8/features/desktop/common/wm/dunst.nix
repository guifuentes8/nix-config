{ pkgs, config, outputs, ... }:
let
  notify = "todo";
  alert = pkgs.writeShellScript "alert.sh" ''
    ${pkgs.pipewire}/bin/pw-play --volume=0,04 ${notify} 
  '';
in {
  services.dunst = {
    enable = true;
    package = pkgs.dunst;
    iconTheme.size = "128x128";
    iconTheme = {
      name = "Tela-circle";
      package = pkgs.tela-circle-icon-theme;
    };
    settings = {
      global = {
        width = 500;
        height = 300;
        min_icon_size = 64;
        max_icon_size = 64;
        corner_radius = 14;
        gaps = true;
        gap_size = 10;
        separator_color = "frame";
        progress_bar_frame_width = 1;
        progress_bar_min_width = 150;
        progress_bar_max_width = 300;
        offset = "10x30";
        origin = "top-right";
        font = "JetBrainsMonoNL Nerd Font 12";
        frame_width = 3;
        frame_color = "#${config.colorScheme.palette.base08}";
        notification_limit = 0;
        separator_height = 2;
        padding = 8;
        horizontal_padding = 8;
        text_icon_padding = 0;
        sort = "yes";

      };
      urgency_low = {
        background = "#${config.colorScheme.palette.base00}";
        foreground = "#${config.colorScheme.palette.base05}";
      };
      urgency_normal = {
        background = "#${config.colorScheme.palette.base00}";
        foreground = "#${config.colorScheme.palette.base05}";
        timeout = 5;
      };

      urgency_critical = {
        background = "#${config.colorScheme.palette.base00}";
        foreground = "#${config.colorScheme.palette.base05}";
        frame_color = "#${config.colorScheme.palette.base08}";
      };
      play_sound = {
        summary = "*";
        script = "${alert}";
      };
    };
  };

  home.packages = with pkgs; [ libnotify ];
}

