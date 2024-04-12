{ pkgs, configOptions, ... }: {
  imports = [ ./common ];
  gtk = {
    enable = true;
    font = {
      name = configOptions.styles.font.main;
      size = configOptions.styles.font.size;
    };
    cursorTheme = {
      name = "${configOptions.styles.cursor.name}";
      package = configOptions.styles.cursor.package;
      size = configOptions.styles.cursor.size;
    };
    iconTheme = {
      name = "Adwaita";
      package = pkgs.gnome.adwaita-icon-theme;
    };
    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };
  };

  qt = {
    enable = true;
    style.name = "adwaita-dark";
    style.package = pkgs.adwaita-qt;
    platformTheme = "qtct";
  };

  home.packages = with pkgs; [
    gnome.gnome-music
    gnome.totem
    gnome.geary
    gnome.gnome-tweaks
    gnome.gnome-boxes
  ];

}
