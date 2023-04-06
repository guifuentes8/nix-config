{ pkgs, ... }:
{

  imports = [
    ./plugins/bluetooth
    ./plugins/rbw
  ];

  programs.rofi =
    {
      enable = true;
      terminal = "${pkgs.kitty}/bin/kitty";
      font = "JetBrainsMono Nerd Font 13";
      theme = "~/.config/rofi/catppuccin-frappe.rasi";
      plugins = with pkgs; [
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

  xdg.configFile."rofi/catppuccin-frappe.rasi".source = ./catppuccin-frappe.rasi;

}
