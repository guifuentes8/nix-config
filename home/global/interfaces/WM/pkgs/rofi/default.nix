{ pkgs, lib, config, ... }:

{

  imports = [
    ./plugins/bluetooth
    ./plugins/rbw
  ];

  programs.rofi = {
    enable = true;
    terminal = "${pkgs.kitty}/bin/kitty";
    # theme = (import ./theme.nix {
    #   inherit config lib;
    # });
    theme = "KyotoNight.rasi";
    plugins = with pkgs;
      [
        rofi-bluetooth
        rofi-calc
        rofi-emoji
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
    rofi-rbw
    rofi-power-menu
    rofi-pulse-select
  ];

  xdg.configFile."rofi/KyotoNight.rasi".source = ./KyotoNight.rasi;
}
