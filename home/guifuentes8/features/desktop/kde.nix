{ pkgs, lib, ... }: {
  imports = [ ./common ];

  home.packages = with pkgs; [
    capitaine-cursors
    libsForQt5.qtstyleplugin-kvantum
  ];

  gtk = {
    enable = true;
    iconTheme = {
      name = lib.mkDefault "Colloid-dark";
      package = lib.mkDefault pkgs.colloid-icon-theme;
    };
    theme = {
      name = lib.mkDefault "Colloid-dark";
      package = lib.mkDefault pkgs.colloid-gtk-theme;
    };
  };

  qt = {
    enable = true;
    style.name = lib.mkDefault "kvantum";
    style.package = pkgs.colloid-kde;
    platformTheme = lib.mkForce "kde";
  };

  services.gpg-agent = {
    enable = true;
    pinentryFlavor = lib.mkForce "qt";

  };

}
