{ pkgs, outputs, ... }:
let everforest-cursors = outputs.packages.${pkgs.system}.everforest-cursors;
in {
  stylix = {
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-storm.yaml";
    cursor = {
      name = "everforest-cursors";
      package = everforest-cursors;
      size = 32;
    };
    fonts = { };
    image = ./wallpaper.png;
    opacity = { };
    override = { };
    targets = { nixvim.enable = false; };
  };
}

