{ pkgs, lib, ... }:
let
  cursorName = "phinger-cursors-light";
  cursorPkg = pkgs.phinger-cursors;

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
      terminal = 1.0;
      desktop = 1.0;
    };
    override = {
      base05 = "A9B1D6";
    };
    targets = {
      nixvim.enable = false;
      vim.enable = true;
      vscode.enable = false;
    };
  };

  gtk = {
    enable = true;
    iconTheme = {
      name = lib.mkForce "Papirus-Dark";
      #     package = lib.mkForce pkgs.papirus-icon-theme;
    };
    cursorTheme = {
      name = cursorName;
      size = 32;
    };
  };

  home.sessionVariables = {
    XCURSOR_THEME = cursorName;
    XCURSOR_SIZE = "32";
  };

}
