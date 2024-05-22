{ pkgs, unstable, lib, ... }: {
  imports = [ ./common ];

  home.packages = with pkgs; [
    capitaine-cursors
    libsForQt5.qtstyleplugin-kvantum
  ];
  gtk = {
    enable = true;
    iconTheme = {
      name = lib.mkDefault "";
      package = lib.mkDefault pkgs.catppuccin-papirus-folders;
    };
    theme = {
      name = lib.mkDefault "";
      package = lib.mkDefault pkgs.catppuccin-kde;
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
