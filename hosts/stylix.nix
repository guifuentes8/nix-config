{ pkgs, outputs, ... }:
let
  cursorName = "everforest-cursors";
  cursorPkg = outputs.packages.${pkgs.system}.everforest-cursors;
in
{

  stylix = {
    enable = true;
    autoEnable = true;
    polarity = "dark";
    base16Scheme = "${pkgs.unstable.base16-schemes}/share/themes/ayu-mirage.yaml";
    cursor = {
      name = cursorName;
      package = cursorPkg;
      size = 32;
    };
    fonts = {
      monospace = {
        name = "MonoLisa";
        package = (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; });
      };
    };
    opacity = {
      applications = 1.0;
      terminal = 0.9;
      desktop = 1.0;
    };
    override = { };
    targets = { };
  };

}
