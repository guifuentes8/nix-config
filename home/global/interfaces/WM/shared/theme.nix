{ pkgs, unstable, lib, outputs, ... }:
let
  gtk_theme_name = "Material-DeepOcean-BL";
  gtk_theme = outputs.packages.${pkgs.system}.gtk_theme;
  cursor = outputs.packages.${pkgs.system}.cursor;
in {
  home.pointerCursor = {
    name = "everforest-cursors";
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
      name = lib.mkForce "${gtk_theme_name}";
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
  home.sessionVariables = { GTK_THEME = "${gtk_theme_name}"; };
}

