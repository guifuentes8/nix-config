{ config, ... }:
{
  imports = [
    ./common/global
    ./common/global/desktop/hyprland
  ];

  xdg.configFile."bottom/bottom.toml".source = ./common/global/software-configs/bottom/bottom.toml;
  xdg.configFile."bpytop/bpytop.conf".source = ./common/global/software-configs/bpytop/bpytop.conf;
  xdg.configFile."bpytop/themes/catppuccin_macchiato.theme".source = ./common/global/software-configs/bpytop/themes/catppuccin_macchiato.theme;
  xdg.configFile."cava/config".source = ./common/global/software-configs/cava/config;
  xdg.configFile."dunst/dunstrc".source = ./common/global/software-configs/dunst/dunstrc;
  xdg.configFile."foot/foot.ini".source = ./common/global/software-configs/foot/foot.ini;
  xdg.configFile."hypr/hyprland.conf".source = ./common/global/software-configs/hypr/hyprland.conf;
  xdg.configFile."hypr/hyprpaper.conf".source = ./common/global/software-configs/hypr/hyprpaper.conf;
  xdg.configFile."wpaperd/output.conf".source = ./common/global/software-configs/wpaperd/output.conf;
  xdg.configFile."kitty/kitty.conf".source = ./common/global/software-configs/kitty/kitty.conf;
  xdg.configFile."kitty/catppuccin-macchiato.conf".source = ./common/global/software-configs/kitty/catppuccin-macchiato.conf;
  xdg.configFile."mpv/mpv.conf".source = ./common/global/software-configs/mpv/mpv.conf;
  xdg.configFile."rofi/catppuccin-macchiato.rasi".source = ./common/global/software-configs/rofi/catppuccin-macchiato.rasi;
  xdg.configFile."sptlrx/config.yaml".source = ./common/global/software-configs/sptlrx/config.yaml;
  xdg.configFile."sway/config".source = ./common/global/software-configs/sway/config;
  xdg.configFile."spotify-player/app.toml".source = ./common/global/software-configs/spotify-player/app.toml;
  xdg.configFile."spotify-player/theme.toml".source = ./common/global/software-configs/spotify-player/theme.toml;
  xdg.configFile."waybar/config".source = ./common/global/software-configs/waybar/config;

  xdg.configFile."wallpapers" = {
    source = ./common/global/software-configs/wallpapers;
    recursive = true;
  };
}
