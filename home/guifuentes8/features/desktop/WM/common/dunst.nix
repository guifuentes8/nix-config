{ pkgs, config, ... }:
let
  alert = pkgs.writeShellScript "alert.sh" ''
    ${pkgs.pipewire}/bin/pw-play --volume=0,04  
  '';
in
{
  services.dunst = {
    enable = true;
    package = pkgs.dunst;
    #iconTheme.size = "128x128";
    #iconTheme = {
    #     name = configOptions.styles.icon.name;
    #     package = configOptions.styles.icon.package;
    #};
  };
  #   settings = {
  #     global = {
  #       width = 600;
  #       height = 200;
  #       min_icon_size = 64;
  #       max_icon_size = 64;
  #       corner_radius = configOptions.styles.wm.borderRadius;
  #       gaps = true;
  #       gap_size = 10;
  #       separator_color = "frame";
  #       progress_bar_frame_width = 1;
  #       progress_bar_min_width = 150;
  #       progress_bar_max_width = 300;
  #       offset = "0x10";
  #       origin = "top-center";
  #       #        font =
  #       #          "${configOptions.styles.font.main} ${configOptions.styles.font.size}";
  #       frame_width = configOptions.styles.wm.borderWidth;
  #       frame_color = "#${config.colorScheme.palette.base01}";
  #       notification_limit = 0;
  #       separator_height = 2;
  #       padding = 8;
  #       horizontal_padding = 8;
  #       text_icon_padding = 0;
  #       sort = "yes";
  #     };
  #     urgency_low = {
  #       background = "#${config.colorScheme.palette.base00}";
  #       foreground = "#${config.colorScheme.palette.base05}";
  #     };
  #     urgency_normal = {
  #       background = "#${config.colorScheme.palette.base00}";
  #       foreground = "#${config.colorScheme.palette.base05}";
  #       timeout = 5;
  #     };

  #     urgency_critical = {
  #       background = "#${config.colorScheme.palette.base00}";
  #       foreground = "#${config.colorScheme.palette.base05}";
  #       frame_color = "#${config.colorScheme.palette.base08}";
  #     };
  #     play_sound = {
  #       summary = "*";
  #       script = "${alert}";
  #     };
  #   };
  # };

  home.packages = with pkgs; [ libnotify ];
}

