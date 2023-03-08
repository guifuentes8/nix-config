{ pkgs, ... }:
{
  programs.rofi =
    {
      enable = true;
      package = pkgs.rofi-wayland;
      theme = "~/.config/rofi/catppuccin-macchiato.rasi";
    };
}
