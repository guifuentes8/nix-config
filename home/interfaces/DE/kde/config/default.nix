{ pkgs, lib, ... }:
{

  gtk = {
    enable = true;
    iconTheme = {
      name = "Colloid-dark";
      package = pkgs.colloid-icon-theme;
    };
    theme = {
      name = "Colloid-Dark";
      package = pkgs.colloid-gtk-theme;
    };
  };

  qt = {
    enable = true;
    style.name = "Colloid-Dark";
    style.package = pkgs.colloid-kde;
    platformTheme = "kde";
  };

  services.gpg-agent = {
    enable = true;
    pinentryFlavor = "qt";
  };


  home.packages = with pkgs; [
    capitaine-cursors
    libsForQt5.qtstyleplugin-kvantum
  ];

}
