{ pkgs, ... }:
{
  programs.obs-studio = {
    enable = true;
    package = pkgs.obs-studio;
  };

  xdg.configFile."obs-studio/themes/Catppuccin-Mocha.qss".source = ./Catppuccin-Mocha.qss;

}
