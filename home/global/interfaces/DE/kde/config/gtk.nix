{ pkgs, ... }:
{
  gtk = {
    enable = true;
    iconTheme = {
      name = "Colloid-dark";
      package = pkgs.colloid-icon-theme;
    };
    theme = {
      name = "Kyoto";
      package = pkgs.colloid-gtk-theme;
    };
  };

  qt = {
    enable = true;
    style.name = "Kyoto";
    style.package = pkgs.colloid-kde;
    platformTheme = "kde";
  };

  services.gpg-agent = {
    enable = true;
    pinentryFlavor = "qt";
  };
}
