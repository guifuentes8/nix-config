{ pkgs, ... }:
{
  programs.rofi =
    {
      enable = true;
      package = pkgs.rofi;
      theme = "~/.config/rofi/catppuccin-macchiato.rasi";
    };
}
