{ pkgs, lib, ... }:
{
  imports = [
    ./pkgs
  ];


  home.packages = with pkgs; [
    capitaine-cursors
    libsForQt5.qtstyleplugin-kvantum
  ];

  gtk = {
    enable = true;
    iconTheme = {
      name = "Colloid-dark";
      package = pkgs.colloid-icon-theme;
    };
    theme = {
      name = "Material-DeepOcean-BL";
      package = pkgs.colloid-gtk-theme;
    };
  };

  qt = {
    enable = true;
    style.name = "Material-DeepOcean-BL";
    style.package = pkgs.colloid-kde;
    platformTheme = "kde";
  };

  services.gpg-agent = {
    enable = true;
    pinentryFlavor = lib.mkForce "qt";

  };


}
