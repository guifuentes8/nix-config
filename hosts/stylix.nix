{ pkgs, outputs, ... }:
let
  cursorName = "phinger-cursors-dark";
  cursorPkg = pkgs.unstable.phinger-cursors;
  base16SchemeDefault =
    "${pkgs.base16-schemes}/share/themes/tokyo-night-moon.yaml";

in {

  stylix = {
    enable = true;
    image = ../home/modules/common/extras/eevee.png;
    autoEnable = true;
    polarity = "dark";
    base16Scheme = base16SchemeDefault;
    override = {
      base02 = "#343A52";
      base03 = "#444B6A";
      base04 = "#787C99";
      base05 = "#A9B1D6";
      base06 = "#CBCCD1";
      base07 = "#D5D6DB";
    };

    cursor = {
      name = cursorName;
      package = cursorPkg;
      size = 32;
    };
    fonts = {
      monospace = {
        name = "JetBrainsMonoNL Nerd Font";
        package = pkgs.nerd-fonts.jetbrains-mono;
      };
    };
    opacity = {
      applications = 1.0;
      terminal = 0.85;
      desktop = 1.0;
    };
    override = { };
    targets = { };
  };

}
