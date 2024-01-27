{ pkgs, unstable, lib, outputs, theme, ... }:
let
  gtk_theme = pkgs.catppuccin-gtk.override {
    accents = [
      "sapphire"
    ]; # You can specify multiple accents here to output multiple themes
    size = "standard";
    tweaks = [ "normal" "rimless" ]; # You can also specify multiple tweaks here
    variant = "mocha";
  };
  cursor = pkgs.catppuccin-cursors.mochaDark;
in {
  home.pointerCursor = {
    name = theme.cursor_name;
    package = cursor;
    size = 32;
    gtk.enable = true;
    x11.enable = true;
  };

  gtk = {
    enable = true;
    font = {
      name = lib.mkForce "JetBrainsMonoNL Nerd Font";
      size = lib.mkForce 13;
    };
    cursorTheme = {
      name = lib.mkForce "everforest-cursors";
      package = lib.mkForce cursor;
      size = lib.mkForce 32;
    };
    iconTheme = {
      name = lib.mkForce "Tela-circle";
      package = lib.mkForce pkgs.tela-circle-icon-theme;
    };
    theme = {
      name = lib.mkForce "${theme.gtk_name}";
      package = lib.mkForce gtk_theme;
    };
  };

  qt = {
    enable = true;
    platformTheme = "gtk";
  };

  # home.file.".config/gtk-4.0/gtk.css".source = "${gtk-theme}/share/themes/${gtk_theme_name}/gtk-4.0/gtk-dark.css";
  # home.file.".config/gtk-4.0/assets" = {
  #   recursive = true;
  #   source = "${gtk-theme}/share/themes/${gtk_theme_name}/gtk-4.0/assets";
  # };
  home.sessionVariables = { GTK_THEME = "${theme.gtk_name}"; };
}

