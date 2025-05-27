{ pkgs, lib, outputs, ... }:
let
  cursorName = "everforest-cursors-light";
  cursorPkg = outputs.packages.${pkgs.system}.everforest-cursors;

in {

  stylix = {
    enable = true;
    autoEnable = true;
    polarity = "dark";
    base16Scheme =
      "${pkgs.base16-schemes}/share/themes/everforest-dark-hard.yaml";
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
      terminal = 0.9;
      desktop = 1.0;
    };
    targets = {
      xfce.enable = lib.mkIf (pkgs.stdenv.hostPlatform.isLinux) true;
      nixvim.enable = false;
      vim.enable = true;
      vscode.enable = false;
    };
  };

  gtk = lib.mkIf pkgs.stdenv.hostPlatform.isLinux {
    enable = true;
    iconTheme = {
      name = lib.mkForce "Papirus-Dark";
      package = pkgs.unstable.catppuccin-papirus-folders;

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
