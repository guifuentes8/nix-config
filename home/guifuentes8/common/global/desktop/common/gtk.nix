{
  gtk = {
    enable = true;
    cursorTheme.name = "Catppuccin-Macchiato-Dark-Cursors";
    cursorTheme.package = pkgs.catppuccin-cursors.macchiatoDark;
    iconTheme.name = "Adwaita";
    iconTheme.package = pkgs.gnome.adwaita-icon-theme;
    theme = {
      name = "Catppuccin-Macchiato-Standard-Blue-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "blue" ];
        variant = "macchiato";
      };
    };
  };
}
