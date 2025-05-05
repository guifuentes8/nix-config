{ pkgs, outputs, ... }:
let
  cursorName = "everforest-cursors-light";
  cursorPkg = outputs.packages.${pkgs.system}.everforest-cursors;

in {

  stylix = {
    enable = true;
    image = ../home/modules/common/extras/eevee.jpeg;
    autoEnable = true;
    polarity = "dark";
    base16Scheme =
      "${pkgs.unstable.base16-schemes}/share/themes/everforest-dark-hard.yaml";
    cursor = {
      name = cursorName;
      package = cursorPkg;
      size = 32;
    };
    fonts = {
      monospace = {
        name = "JetBrainsMono";
        package = (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; });
      };
    };
    opacity = {
      applications = 1.0;
      terminal = 1.0;
      desktop = 1.0;
    };
    override = { };
    targets = { };
  };

}
