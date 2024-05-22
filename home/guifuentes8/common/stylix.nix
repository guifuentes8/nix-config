{ pkgs, lib, ... }: {
  stylix = {
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
    cursor = { };
    fonts = { };
    image = ./wallpaper.jpg;
    opacity = { };
    override = { };
    targets = { };
  };

  gtk = {
 enable = true;
 
  iconTheme = {
    name = lib.mkForce "Colloid-dark";
    package = lib.mkForce pkgs.colloid-icon-theme;
  };
  };
}

