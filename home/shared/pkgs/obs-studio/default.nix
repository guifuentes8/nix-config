{ pkgs, ... }:
{
  programs.obs-studio = {
    enable = true;
    package = pkgs.obs-studio;
  };

  xdg.configFile."obs-studio/themes/Catppuccin-Frappe.qss".source = ./Catppuccin-Frappe.qss;

}
