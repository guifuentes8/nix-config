{ pkgs, lib, config, ... }:

{

  imports = [
    ./plugins/bluetooth
    ./plugins/rbw
  ];

  programs.rofi = {
    enable = true;
    terminal = "${pkgs.alacritty}/bin/alacritty";
    theme = (import ./theme.nix {
      inherit config lib;
    });
    plugins = with pkgs;
      [
        rofi-bluetooth
        rofi-calc
        rofi-emoji
        rofi-file-browser
        rofi-rbw
        rofi-pass
        rofi-power-menu
        rofi-pulse-select
      ];
  };

  home.packages = with pkgs; [
    rofi-bluetooth
    rofi-calc
    rofi-emoji
    rofi-file-browser
    rofi-rbw
    rofi-pass
    rofi-power-menu
    rofi-pulse-select
  ];

}