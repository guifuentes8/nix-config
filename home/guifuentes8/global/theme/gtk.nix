{ pkgs, unstable, lib, outputs, theme, nix-colors, ... }:
let
  gtk-theme = pkgs.catppuccin-gtk.override {
    accents = [
      "teal"
    ]; # You can specify multiple accents here to output multiple themes
    size = "standard";
    tweaks = [ "rimless" ]; # You can also specify multiple tweaks here
    variant = "frappe";
  };
  gtk-name = "Catppuccin-Frappe-Standard-Teal-Dark";
in {

  home.sessionVariables.GTK_THEME = gtk-name;
  gtk = {
    enable = true;
    font = {
      name = lib.mkForce "MonoLisa";
      size = lib.mkForce 13;
    };
    theme = {
      name = gtk-name;
      package = gtk-theme;
    };

  };

  # home.file.".config/gtk-4.0/gtk.css".source = "${gtk-theme}/share/themes/${gtk_theme_name}/gtk-4.0/gtk-dark.css";
  # home.file.".config/gtk-4.0/assets" = {
  #   recursive = true;
  #   source = "${gtk-theme}/share/themes/${gtk_theme_name}/gtk-4.0/assets";
  # };

}

