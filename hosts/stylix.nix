{ pkgs, inputs, ... }:
let
  cursorName = "phinger-cursors-light";
  cursorPkg = pkgs.phinger-cursors;
in {

  stylix = {
    enable = true;
    image = ../home/modules/common/extras/eevee.jpeg;
    autoEnable = true;
    polarity = "dark";
    base16Scheme = "${pkgs.unstable.base16-schemes}/share/themes/ayu-dark.yaml";
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
      terminal = 1.0;
      desktop = 1.0;
    };
    override = { };
    targets = { };
  };

}
