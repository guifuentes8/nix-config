{ pkgs, lib, config, configOptions, ... }:

{
  programs.rofi = {
    enable = true;
    terminal = "${pkgs.kitty}/bin/kitty";
    theme = (import ./theme.nix { inherit config lib configOptions; });
    plugins = with pkgs; [
      rofi-bluetooth
      rofi-calc
      rofi-emoji
      rofi-power-menu
      rofi-pulse-select
      rofi-systemd
      rofi-pass
    ];
  };

  home.packages = with pkgs; [
    rofi-bluetooth
    rofi-calc
    rofi-emoji
    rofi-power-menu
    rofi-pulse-select
    rofi-systemd
    rofi-pass
  ];

  # xdg.configFile."rofi/KyotoNight.rasi".source = ./KyotoNight.rasi;
}
