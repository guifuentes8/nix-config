{ pkgs, outputs, ... }:
let everforest-cursors = outputs.packages.${pkgs.system}.everforest-cursors;
in {
  stylix = {
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-storm.yaml";
    cursor = {
      name = "Breeze_Hacked";
      package = pkgs.breeze-hacked-cursor-theme;
      size = 36;
    };
    fonts = { };
    image = ./wallpaper.png;
    opacity = { };
    override = { };
    targets = { nixvim.enable = false; };
  };
}

