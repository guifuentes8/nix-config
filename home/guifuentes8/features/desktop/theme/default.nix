{ pkgs, outputs, configOptions, ... }: {

  home = {
    sessionVariables.GTK_THEME = configOptions.styles.gtk.name;
    pointerCursor = {
      name = configOptions.styles.cursor.name;
      package = configOptions.styles.cursor.package;
      size = pkgs.lib.strings.toInt configOptions.styles.cursor.size;
      gtk.enable = true;
      x11.enable = true;
    };
  };
  gtk = {
    enable = true;
    font = {
      name = configOptions.styles.font.main;
      size = pkgs.lib.strings.toInt configOptions.styles.font.size;
    };
    theme = {
      name = configOptions.styles.gtk.name;
      #package = configOptions.styles.gtk.package;
      package = outputs.packages.${pkgs.system}.gtk_theme;
    };
    iconTheme = {
      name = configOptions.styles.icon.name;
      package = configOptions.styles.icon.package;
    };
    cursorTheme = {
      name = configOptions.styles.cursor.name;
      # package = configOptions.styles.cursor.package;
      package = outputs.packages.${pkgs.system}.cursor_theme;
      size = pkgs.lib.strings.toInt configOptions.styles.cursor.size;
    };
  };

  # home.file.".config/gtk-4.0/gtk.css".source = "${gtk-theme}/share/themes/${gtk_theme_name}/gtk-4.0/gtk-dark.css";
  # home.file.".config/gtk-4.0/assets" = {
  #   recursive = true;
  #   source = "${gtk-theme}/share/themes/${gtk_theme_name}/gtk-4.0/assets";
  # };

  qt = {
    enable = true;
    platformTheme = "gtk";
  };

}

