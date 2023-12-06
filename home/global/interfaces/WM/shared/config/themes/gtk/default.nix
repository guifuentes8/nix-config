{ pkgs, unstable, lib, outputs, ... }:
let
  gtk-theme-name = "Kyoto";
  gtk-theme = outputs.packages.${pkgs.system}.kyoto-gtk-theme;
  # gtk-theme = pkgs.colloid-gtk-theme.override {
  #   tweaks = [ "black" ]; # You can also specify multiple tweaks here
  #   colorVariants = [ "dark" ]; # You can also specify multiple tweaks here
  #   themeVariants = [ "default" ]; # You can also specify multiple tweaks here
  #   sizeVariants = [ "standard" ]; # You can also specify multiple tweaks here
  # };
in
{
  gtk = {
    enable = true;
    font = {
      name = lib.mkForce "JetBrainsMonoNL Nerd Font";
      size = lib.mkForce 13;
    };
    cursorTheme = {
      name = lib.mkForce "phinger-cursors";
      package = lib.mkForce pkgs.phinger-cursors;
      size = lib.mkForce 32;
    };
    iconTheme = {
      name = lib.mkForce "Tela-circle";
      package = lib.mkForce pkgs.tela-circle-icon-theme;
    };
    theme = {
      name = lib.mkForce "${gtk-theme-name}";
      package = lib.mkForce gtk-theme;
    };
  };

  # home.file.".config/gtk-4.0/gtk.css".source = "${gtk-theme}/share/themes/${gtk-theme-name}/gtk-4.0/gtk-dark.css";
  # home.file.".config/gtk-4.0/assets" = {
  #   recursive = true;
  #   source = "${gtk-theme}/share/themes/${gtk-theme-name}/gtk-4.0/assets";
  # };
  home.sessionVariables.GTK_THEME = "${gtk-theme-name}";
}

