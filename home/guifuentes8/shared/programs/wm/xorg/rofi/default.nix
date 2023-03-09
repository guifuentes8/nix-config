{ pkgs, ... }:
{
  imports = [
    ./rbw.nix
  ];

  programs.rofi =
    {
      enable = true;
      terminal = "${pkgs.kitty}/bin/kitty";
      package = pkgs.rofi;
      font = "JetBrainsMono Nerd Font 13";
      theme = "~/.config/rofi/catppuccin-macchiato.rasi";
      plugins = with pkgs; [
        rofi-emoji
        rofi-rbw
        rofi-calc
        rofi-bluetooth
        rofi-power-menu
        rofi-pulse-select
        rofi-file-browser
      ];
    };

  home.packages = with pkgs; [
    rofi-emoji
    rofi-calc
    rofi-bluetooth
    rofi-power-menu
    rofi-pulse-select
    rofi-file-browser
  ];

  xdg.configFile."rofi/catppuccin-macchiato.rasi".source = ./catppuccin-macchiato.rasi;

}
