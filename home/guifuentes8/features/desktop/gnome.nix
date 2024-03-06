{ pkgs, ... }: {
  imports = [ ];
  gtk = {
    enable = true;
    font = {
      name = "JetBrainsMonoNL Nerd Font";
      size = 13;
    };
    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
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
