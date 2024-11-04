{ pkgs, unstable, ... }:
let
  cursorName = "phinger-cursors-dark";
  cursorPkg = pkgs.phinger-cursors;

in {

  stylix = {
    enable = true;
    autoEnable = true;
    polarity = "dark";
    base16Scheme = "${unstable.base16-schemes}/share/themes/ayu-dark.yaml";

    cursor = {
      name = cursorName;
      package = cursorPkg;
      size = 32;
    };
    fonts = {
      monospace = {
        name = "JetBrainsMonoNL Nerd Font";
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
